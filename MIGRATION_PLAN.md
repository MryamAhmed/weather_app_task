# Weather App – Clean Architecture Migration Plan

> Goal: refactor the current Weather app into a **Clean Architecture** project that uses
> **GetIt + injectable** (DI), **go_router** (navigation), **freezed** (models / states / unions)
> and **fpdart** (`Either` / `TaskEither`) instead of `dartz`.
>
> The plan is split into ordered phases so we can execute it step-by-step without breaking the
> running app.

---

## 0. Current State (audit)

Current `lib/` tree:

```
lib/
├── const.dart
├── main.dart
├── simple_bloc_observer.dart
├── core/
│   ├── cash_helper.dart                  # SharedPreferences wrapper
│   ├── error/failure.dart                # dartz-based Failure
│   └── utils/api.dart                    # Dio wrapper
└── features/
    ├── home/
    │   ├── data/
    │   │   ├── models/weather_model.dart
    │   │   └── repos/{home_repo.dart, home_repo_impl.dart}
    │   └── presentation/
    │       ├── manager/{weather_cubit.dart, weather_state.dart}
    │       └── views/{home_view.dart, widgets/...}
    └── search/
        └── presentation/views/{search_view.dart, widgets/...}
```

Pain points to fix:
- No `domain` layer (entities / repository contracts / use-cases).
- No DI container — `WeatherCubit(HomeRepoImpl(ApiService(Dio())))` is built by hand in `main.dart`.
- Navigation done with `Navigator.push(MaterialPageRoute(...))` directly inside widgets.
- States/models written by hand → boilerplate, no `copyWith`, no value equality.
- `dartz` is dead-ish, we want `fpdart`.
- API key, base URL, and color constants are scattered (`const.dart`, hard-coded URL inside repo).

---

## 1. Target Structure

We follow the structure exactly as required, **adapted to the weather domain** (so `home` =
weather home, `search` is a real feature, and we drop the donations-specific folders that don’t
apply yet — but we keep the placeholders for `auth`/`profile` only if/when needed).

```
lib/
├── main.dart                       # entrypoint → calls bootstrap()
├── app.dart                        # MaterialApp.router(...) + theme + GoRouter
├── bootstrap.dart                  # WidgetsFlutterBinding, configureDependencies(), runApp
├── injection_container.dart        # GetIt instance + @InjectableInit hook
│
├── core/
│   ├── error/
│   │   ├── exceptions.dart         # ServerException, CacheException, NetworkException
│   │   └── failures.dart           # Failure (freezed union: server/cache/network/unknown)
│   ├── network/
│   │   ├── api_client.dart         # Dio factory (BaseOptions, interceptors)
│   │   ├── network_info.dart       # connectivity_plus wrapper
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart
│   │       ├── error_interceptor.dart
│   │       └── logging_interceptor.dart
│   ├── routes/
│   │   ├── app_router.dart         # GoRouter config (injectable)
│   │   └── route_names.dart        # static const route paths/names
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── app_colors.dart         # replaces const.dart::mainColor
│   ├── constants/
│   │   └── app_constants.dart      # base URL, API key, cache keys
│   ├── localization/
│   │   ├── app_localizations.dart
│   │   └── langs/
│   ├── usecase/
│   │   └── usecase.dart            # base UseCase<Type, Params> contract
│   └── utils/
│       ├── helpers.dart
│       └── cache_helper.dart       # renamed CasheHelper (typo fix), still SharedPreferences
│
├── shared/                         # cross-feature reusables (kept minimal for now)
│   └── presentation/
│       └── widgets/
│           ├── app_bar_widget.dart
│           ├── loading_widget.dart
│           └── error_widget.dart   # replaces faield_body.dart
│
└── features/
    ├── home/                       # weather "home" feature
    │   ├── data/
    │   │   ├── models/
    │   │   │   └── weather_model.dart            # freezed + json_serializable
    │   │   ├── data_sources/
    │   │   │   ├── weather_remote_data_source.dart
    │   │   │   └── weather_local_data_source.dart   # last-city + cached weather
    │   │   └── repositories/
    │   │       └── home_repository_impl.dart
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── weather.dart                  # freezed pure entity (no JSON)
    │   │   ├── repositories/
    │   │   │   └── home_repository.dart          # abstract
    │   │   └── usecases/
    │   │       ├── get_current_weather.dart
    │   │       ├── get_cached_city.dart
    │   │       └── save_city.dart
    │   └── presentation/
    │       ├── pages/
    │       │   └── home_page.dart                # was home_view.dart
    │       ├── widgets/
    │       │   └── home_view_body.dart
    │       └── manager/
    │           ├── home_cubit.dart               # was weather_cubit.dart
    │           └── home_state.dart               # freezed union
    │
    └── search/
        ├── domain/
        │   └── usecases/
        │       └── search_city_weather.dart
        └── presentation/
            ├── pages/
            │   └── search_page.dart              # was search_view.dart
            ├── widgets/
            │   └── search_view_body.dart
            └── manager/
                ├── search_cubit.dart
                └── search_state.dart
```

> Folders `about_association`, `profile`, `donate`, `auth` from the template are **not part of
> this app**, so we keep the *pattern* but only scaffold them on demand. The structure above is
> 100% compatible with adding them later.

---

## 2. Dependencies (`pubspec.yaml`)

### 2.1 Add / replace runtime deps
```yaml
dependencies:
  flutter:
    sdk: flutter

  # State mgmt (kept)
  flutter_bloc: ^8.1.6
  bloc: ^8.1.4

  # Functional
  fpdart: ^1.1.0                # replaces dartz
  equatable: ^2.0.5

  # DI
  get_it: ^7.7.0
  injectable: ^2.4.4

  # Routing
  go_router: ^14.2.7

  # Codegen-friendly models / unions
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Networking
  dio: ^5.7.0
  pretty_dio_logger: ^1.4.0
  internet_connection_checker_plus: ^2.5.1   # for NetworkInfo

  # Storage
  shared_preferences: ^2.3.2

  cupertino_icons: ^1.0.8
```

### 2.2 Add dev deps
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

  build_runner: ^2.4.13
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  injectable_generator: ^2.6.2
```

### 2.3 Remove
- `dartz` (replaced by `fpdart`).
- `meta` (only used for `@immutable` in old states; freezed makes it unnecessary).

### 2.4 Codegen command
We will run after every change to annotated files:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 3. Phase-by-Phase Migration

### Phase 1 – Project scaffolding & pubspec
1. Update `pubspec.yaml` per §2.
2. `flutter pub get`.
3. Create the empty target folders from §1 (no code yet, just `.gitkeep` if needed).
4. Move `const.dart::mainColor` → `core/theme/app_colors.dart`.
5. Move API base URL + key + endpoints → `core/constants/app_constants.dart`:
   ```dart
   abstract class AppConstants {
     static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
     static const String apiKey  = '096e1aea2ab31151168f21eb88822bb4';
     static const String currentWeatherPath = '/weather';
     static const String cachedCityKey = 'city';
   }
   ```
6. Rename `cash_helper.dart` → `core/utils/cache_helper.dart`, fix `CasheHelper` → `CacheHelper`.

### Phase 2 – Dependency Injection (GetIt + injectable)
1. Create `lib/injection_container.dart`:
   ```dart
   import 'package:get_it/get_it.dart';
   import 'package:injectable/injectable.dart';
   import 'injection_container.config.dart';

   final GetIt sl = GetIt.instance;

   @InjectableInit(
     initializerName: r'$initGetIt',
     preferRelativeImports: true,
     asExtension: false,
   )
   Future<void> configureDependencies() async => $initGetIt(sl);
   ```
2. Create `lib/bootstrap.dart`:
   ```dart
   Future<void> bootstrap() async {
     WidgetsFlutterBinding.ensureInitialized();
     await CacheHelper.init();          // SharedPreferences
     await configureDependencies();     // generated DI graph
     Bloc.observer = sl<SimpleBlocObserver>();
     runApp(const WeatherApp());
   }
   ```
3. Create `lib/main.dart`:
   ```dart
   void main() => bootstrap();
   ```
4. Create `lib/app.dart` – `WeatherApp` becomes a `MaterialApp.router` consuming
   `sl<AppRouter>().router`.
5. Annotate everything that should be registered:
   - `@LazySingleton(as: HomeRepository)` on `HomeRepositoryImpl`.
   - `@LazySingleton()` on data sources, `ApiClient`, `NetworkInfo`, use-cases, `AppRouter`.
   - `@injectable` on `HomeCubit`, `SearchCubit` (factories — new instance per page).
   - For `Dio` / `SharedPreferences` provide them via a module:
     ```dart
     @module
     abstract class RegisterModule {
       @lazySingleton
       Dio dio() => ApiClient.create(); // builds Dio with interceptors

       @preResolve
       Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
     }
     ```
6. Run codegen → `injection_container.config.dart` is produced.
7. Delete the manual `BlocProvider(create: (_) => WeatherCubit(HomeRepoImpl(ApiService(Dio()))))`
   in `main.dart` — cubits are now provided in routes via `BlocProvider(create: (_) => sl())`.

### Phase 3 – Networking layer
1. `core/network/api_client.dart`:
   - `static Dio create()` returns a `Dio` configured with `BaseOptions(baseUrl: AppConstants.baseUrl)`,
     timeouts, and adds `LoggingInterceptor`, `ErrorInterceptor`, `AuthInterceptor`
     (the auth one will inject `appid` query param for OpenWeather).
2. `core/network/network_info.dart`:
   ```dart
   abstract class NetworkInfo { Future<bool> get isConnected; }

   @LazySingleton(as: NetworkInfo)
   class NetworkInfoImpl implements NetworkInfo { ... }
   ```
3. Interceptors:
   - `auth_interceptor.dart` – appends `appid=<apiKey>` & `units=metric` to every request.
   - `error_interceptor.dart` – throws typed `ServerException` from `core/error/exceptions.dart`.
   - `logging_interceptor.dart` – wraps `pretty_dio_logger`.
4. Delete old `core/utils/api.dart` (replaced by `ApiClient` + data sources calling `Dio` directly,
   or a thin `RestClient` if we want).

### Phase 4 – Error layer (freezed Failures + fpdart)
1. `core/error/exceptions.dart` – plain Dart classes thrown from data sources:
   ```dart
   class ServerException implements Exception { final String message; ... }
   class CacheException implements Exception {}
   class NetworkException implements Exception {}
   ```
2. `core/error/failures.dart` – freezed union returned from repositories:
   ```dart
   @freezed
   class Failure with _$Failure {
     const factory Failure.server(String message)  = ServerFailure;
     const factory Failure.cache(String message)   = CacheFailure;
     const factory Failure.network()               = NetworkFailure;
     const factory Failure.unknown(String message) = UnknownFailure;
   }
   ```
3. Delete old `core/error/failure.dart` (with `dartz` import).
4. Repositories return `Future<Either<Failure, T>>` from **fpdart**:
   ```dart
   import 'package:fpdart/fpdart.dart';
   ```
5. Cubits replace `result.fold((l) => …, (r) => …)` with the fpdart equivalent (same API).

### Phase 5 – Domain layer (entities, contracts, use-cases)
1. `core/usecase/usecase.dart`:
   ```dart
   abstract class UseCase<Type, Params> {
     Future<Either<Failure, Type>> call(Params params);
   }
   class NoParams { const NoParams(); }
   ```
2. `features/home/domain/entities/weather.dart` – **freezed** entity, *no JSON code*.
3. `features/home/domain/repositories/home_repository.dart` – abstract:
   ```dart
   abstract class HomeRepository {
     Future<Either<Failure, Weather>> getCurrentWeather(String city);
     Future<Either<Failure, String?>>  getCachedCity();
     Future<Either<Failure, Unit>>    saveCity(String city);
   }
   ```
4. Use-cases (one class each, all `@lazySingleton`):
   - `GetCurrentWeather` (Params = `String city`)
   - `GetCachedCity` (Params = `NoParams`)
   - `SaveCity` (Params = `String city`)
   - `SearchCityWeather` lives under `features/search/domain/usecases/` and may simply delegate
     to `GetCurrentWeather` + `SaveCity`.

### Phase 6 – Data layer
1. `weather_model.dart`: convert to **freezed + json_serializable**:
   ```dart
   @freezed
   class WeatherModel with _$WeatherModel {
     const WeatherModel._(); // for custom getters (getImage / getColor → moved to UI)
     const factory WeatherModel({
       required String name,
       required _Main main,
       required List<_Weather> weather,
     }) = _WeatherModel;
     factory WeatherModel.fromJson(Map<String, dynamic> json) =>
         _$WeatherModelFromJson(json);
   }
   ```
   - Move `getImage()` / `getColor()` out of the model into a presentation helper
     (`features/home/presentation/widgets/weather_visuals.dart`) — *models must not depend on
     Flutter's `Color`/assets*.
   - Add `toEntity()` extension that returns the `Weather` domain entity.
2. `weather_remote_data_source.dart` – uses `Dio` (injected); throws `ServerException` on error.
3. `weather_local_data_source.dart` – uses `SharedPreferences`; throws `CacheException`.
4. `home_repository_impl.dart`:
   - Implements `HomeRepository`.
   - Uses `NetworkInfo` to decide remote vs cache.
   - Wraps calls in `try/catch` and returns `Right(entity)` or `Left(Failure.x())` via fpdart.

### Phase 7 – Presentation layer
1. **State with freezed union**:
   ```dart
   @freezed
   class HomeState with _$HomeState {
     const factory HomeState.initial()                       = _Initial;
     const factory HomeState.loading()                       = _Loading;
     const factory HomeState.success(Weather weather)        = _Success;
     const factory HomeState.failure(String message)         = _Failure;
     const factory HomeState.empty()                         = _Empty; // was WeatherNullState
   }
   ```
2. `HomeCubit` (was `WeatherCubit`):
   - Constructor injects `GetCurrentWeather`, `GetCachedCity`, `SaveCity` via `@injectable`.
   - `loadInitial()` → reads cached city → if null emits `empty`, else calls `GetCurrentWeather`.
   - `refresh(city)` → emits loading → use-case → `state.when(...)`.
   - Uses `state.maybeWhen` / `result.fold` everywhere (no more `is` checks duplication).
3. `home_page.dart`:
   - `BlocBuilder<HomeCubit, HomeState>` with `state.when(...)` → returns the right widget.
4. `search_page.dart`:
   - Similar pattern with `SearchCubit`.
5. Move `faield_body.dart` → `shared/presentation/widgets/error_widget.dart` (also fix typo).

### Phase 8 – Routing (go_router)
1. `core/routes/route_names.dart`:
   ```dart
   abstract class RouteNames {
     static const home   = '/';
     static const search = '/search';
   }
   ```
2. `core/routes/app_router.dart`:
   ```dart
   @lazySingleton
   class AppRouter {
     final GoRouter router = GoRouter(
       initialLocation: RouteNames.home,
       routes: [
         GoRoute(
           path: RouteNames.home,
           name: 'home',
           builder: (_, __) => BlocProvider(
             create: (_) => sl<HomeCubit>()..loadInitial(),
             child: const HomePage(),
           ),
         ),
         GoRoute(
           path: RouteNames.search,
           name: 'search',
           builder: (_, __) => BlocProvider(
             create: (_) => sl<SearchCubit>(),
             child: const SearchPage(),
           ),
         ),
       ],
     );
   }
   ```
3. In `app.dart`:
   ```dart
   MaterialApp.router(
     routerConfig: sl<AppRouter>().router,
     theme: AppTheme.light,
     debugShowCheckedModeBanner: false,
   );
   ```
4. Replace the existing `Navigator.push(MaterialPageRoute(...))` in `home_page.dart` with
   `context.pushNamed('search')`.

### Phase 9 – Theme & shared widgets
1. `core/theme/app_theme.dart`: `ThemeData light`, `ThemeData dark` using `AppColors`.
2. Extract reusable widgets:
   - `loading_widget.dart` — centered `CircularProgressIndicator`.
   - `error_widget.dart` — current `faieldBody` cleaned up.
   - `app_bar_widget.dart` — extract the AppBar from `home_view.dart`.

### Phase 10 – Cleanup & verification
1. Delete:
   - `lib/const.dart`
   - `lib/simple_bloc_observer.dart` if rewritten under `core/utils/`
   - `lib/core/cash_helper.dart`
   - `lib/core/utils/api.dart`
   - `lib/core/error/failure.dart`
   - all `*_view.dart` (renamed to `*_page.dart`)
2. Run:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter analyze
   flutter test
   ```
3. Smoke-test on a device/emulator: open app → cached-city flow → search → fetch → error path.

---

## 4. Migration Order Cheat-sheet

| # | Step                                                       | Risk if skipped               |
|---|------------------------------------------------------------|-------------------------------|
| 1 | Update `pubspec.yaml`, run `pub get`                        | nothing else works            |
| 2 | Create `injection_container` + `bootstrap` + empty `app.dart` | DI not wired                |
| 3 | Move constants/theme/cache helper into `core/`              | scattered config             |
| 4 | Rebuild `core/network` (api_client + interceptors + network_info) | data layer can’t be DI’d |
| 5 | Convert `Failure` → freezed + swap `dartz` → `fpdart`       | breaks repo signatures        |
| 6 | Add `domain` layer (entities, repo abstracts, use-cases)    | not clean architecture yet    |
| 7 | Rebuild `data` layer (model freezed + data sources + repo impl) | use-cases can’t resolve   |
| 8 | Rewrite `HomeCubit` / `SearchCubit` with freezed state + use-cases | UI broken                |
| 9 | Add `go_router` and `app.dart`                              | navigation still imperative   |
| 10| Delete legacy files, run codegen, analyze, smoke-test       | dead code & lints             |

---

## 5. Acceptance Checklist

- [ ] `lib/` matches the target tree from §1.
- [ ] `pubspec.yaml` contains **GetIt + injectable**, **go_router**, **freezed**, **fpdart**.
- [ ] No reference to `dartz` anywhere in the repo.
- [ ] `main.dart` only calls `bootstrap()`.
- [ ] All cubits / repos / data sources / use-cases / `Dio` / `SharedPreferences` / `AppRouter`
      are resolved through `GetIt` (no manual `new` in widgets / `main.dart`).
- [ ] `HomeState` & `Failure` are **freezed unions**; UI uses `state.when(...)`.
- [ ] All repository methods return `fpdart.Either<Failure, T>`.
- [ ] Navigation between Home and Search uses `go_router` (`context.pushNamed`).
- [ ] `flutter analyze` returns 0 errors / 0 warnings.
- [ ] `flutter pub run build_runner build --delete-conflicting-outputs` succeeds.
- [ ] App runs end-to-end: load cached city → fetch weather → search → success/failure UI.

---

## 6. Notes / Decisions

- **fpdart over dartz** — `Either`, `Unit`, `Option` ergonomics are equivalent; switch is mostly
  a one-line import change inside repos/cubits.
- **freezed for both models AND states** — keeps `copyWith`, value equality, exhaustive `when`.
- **Why a `shared/` folder but no `auth/profile/donate/about_association`?** This template is
  for a generic donations app. Our Weather app does not need them yet, so we *do not* create
  empty feature folders — we keep `shared/` for cross-feature widgets and add new features only
  when their first real screen exists.
- **API key** stays in `app_constants.dart` for now; later can be moved to `--dart-define` /
  `.env` via `flutter_dotenv` if security becomes a concern.
- **Tests** are out of scope for this migration but the new architecture (use-cases + abstract
  repos) makes them trivial to add later (mock the abstract repo, unit-test the cubit).
