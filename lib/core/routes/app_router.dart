import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/search/presentation/manager/search_cubit.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../injection_container.dart';
import 'route_names.dart';

@lazySingleton
class AppRouter {
  GoRouter get router {
    return GoRouter(
      initialLocation: RouteNames.home,
      routes: [
        GoRoute(
          path: RouteNames.home,
          name: RouteNames.homeName,
          builder: (context, state) {
            return BlocProvider(
              create: (_) => sl<HomeCubit>()..loadInitial(),
              child: const HomePage(),
            );
          },
        ),
        GoRoute(
          path: RouteNames.search,
          name: RouteNames.searchName,
          builder: (context, state) {
            return BlocProvider(
              create: (_) => sl<SearchCubit>(),
              child: const SearchPage(),
            );
          },
        ),
      ],
    );
  }
}
