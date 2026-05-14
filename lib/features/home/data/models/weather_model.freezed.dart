// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  String get name => throw _privateConstructorUsedError;
  MainWeatherModel get main => throw _privateConstructorUsedError;
  List<WeatherDescriptionModel> get weather =>
      throw _privateConstructorUsedError;

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {String name,
      MainWeatherModel main,
      List<WeatherDescriptionModel> weather});

  $MainWeatherModelCopyWith<$Res> get main;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? main = null,
    Object? weather = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainWeatherModel,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescriptionModel>,
    ) as $Val);
  }

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MainWeatherModelCopyWith<$Res> get main {
    return $MainWeatherModelCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MainWeatherModel main,
      List<WeatherDescriptionModel> weather});

  @override
  $MainWeatherModelCopyWith<$Res> get main;
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? main = null,
    Object? weather = null,
  }) {
    return _then(_$WeatherModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainWeatherModel,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherDescriptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherModelImpl extends _WeatherModel {
  const _$WeatherModelImpl(
      {required this.name,
      required this.main,
      required final List<WeatherDescriptionModel> weather})
      : _weather = weather,
        super._();

  factory _$WeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherModelImplFromJson(json);

  @override
  final String name;
  @override
  final MainWeatherModel main;
  final List<WeatherDescriptionModel> _weather;
  @override
  List<WeatherDescriptionModel> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  String toString() {
    return 'WeatherModel(name: $name, main: $main, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, main, const DeepCollectionEquality().hash(_weather));

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherModel extends WeatherModel {
  const factory _WeatherModel(
          {required final String name,
          required final MainWeatherModel main,
          required final List<WeatherDescriptionModel> weather}) =
      _$WeatherModelImpl;
  const _WeatherModel._() : super._();

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$WeatherModelImpl.fromJson;

  @override
  String get name;
  @override
  MainWeatherModel get main;
  @override
  List<WeatherDescriptionModel> get weather;

  /// Create a copy of WeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MainWeatherModel _$MainWeatherModelFromJson(Map<String, dynamic> json) {
  return _MainWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$MainWeatherModel {
  num get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_min')
  num get tempMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_max')
  num get tempMax => throw _privateConstructorUsedError;

  /// Serializes this MainWeatherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MainWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainWeatherModelCopyWith<MainWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainWeatherModelCopyWith<$Res> {
  factory $MainWeatherModelCopyWith(
          MainWeatherModel value, $Res Function(MainWeatherModel) then) =
      _$MainWeatherModelCopyWithImpl<$Res, MainWeatherModel>;
  @useResult
  $Res call(
      {num temp,
      @JsonKey(name: 'temp_min') num tempMin,
      @JsonKey(name: 'temp_max') num tempMax});
}

/// @nodoc
class _$MainWeatherModelCopyWithImpl<$Res, $Val extends MainWeatherModel>
    implements $MainWeatherModelCopyWith<$Res> {
  _$MainWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? tempMin = null,
    Object? tempMax = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as num,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainWeatherModelImplCopyWith<$Res>
    implements $MainWeatherModelCopyWith<$Res> {
  factory _$$MainWeatherModelImplCopyWith(_$MainWeatherModelImpl value,
          $Res Function(_$MainWeatherModelImpl) then) =
      __$$MainWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num temp,
      @JsonKey(name: 'temp_min') num tempMin,
      @JsonKey(name: 'temp_max') num tempMax});
}

/// @nodoc
class __$$MainWeatherModelImplCopyWithImpl<$Res>
    extends _$MainWeatherModelCopyWithImpl<$Res, _$MainWeatherModelImpl>
    implements _$$MainWeatherModelImplCopyWith<$Res> {
  __$$MainWeatherModelImplCopyWithImpl(_$MainWeatherModelImpl _value,
      $Res Function(_$MainWeatherModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? tempMin = null,
    Object? tempMax = null,
  }) {
    return _then(_$MainWeatherModelImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as num,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainWeatherModelImpl implements _MainWeatherModel {
  const _$MainWeatherModelImpl(
      {required this.temp,
      @JsonKey(name: 'temp_min') required this.tempMin,
      @JsonKey(name: 'temp_max') required this.tempMax});

  factory _$MainWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainWeatherModelImplFromJson(json);

  @override
  final num temp;
  @override
  @JsonKey(name: 'temp_min')
  final num tempMin;
  @override
  @JsonKey(name: 'temp_max')
  final num tempMax;

  @override
  String toString() {
    return 'MainWeatherModel(temp: $temp, tempMin: $tempMin, tempMax: $tempMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainWeatherModelImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.tempMax, tempMax) || other.tempMax == tempMax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temp, tempMin, tempMax);

  /// Create a copy of MainWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainWeatherModelImplCopyWith<_$MainWeatherModelImpl> get copyWith =>
      __$$MainWeatherModelImplCopyWithImpl<_$MainWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _MainWeatherModel implements MainWeatherModel {
  const factory _MainWeatherModel(
          {required final num temp,
          @JsonKey(name: 'temp_min') required final num tempMin,
          @JsonKey(name: 'temp_max') required final num tempMax}) =
      _$MainWeatherModelImpl;

  factory _MainWeatherModel.fromJson(Map<String, dynamic> json) =
      _$MainWeatherModelImpl.fromJson;

  @override
  num get temp;
  @override
  @JsonKey(name: 'temp_min')
  num get tempMin;
  @override
  @JsonKey(name: 'temp_max')
  num get tempMax;

  /// Create a copy of MainWeatherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainWeatherModelImplCopyWith<_$MainWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherDescriptionModel _$WeatherDescriptionModelFromJson(
    Map<String, dynamic> json) {
  return _WeatherDescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherDescriptionModel {
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this WeatherDescriptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherDescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDescriptionModelCopyWith<WeatherDescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDescriptionModelCopyWith<$Res> {
  factory $WeatherDescriptionModelCopyWith(WeatherDescriptionModel value,
          $Res Function(WeatherDescriptionModel) then) =
      _$WeatherDescriptionModelCopyWithImpl<$Res, WeatherDescriptionModel>;
  @useResult
  $Res call({String main, String description});
}

/// @nodoc
class _$WeatherDescriptionModelCopyWithImpl<$Res,
        $Val extends WeatherDescriptionModel>
    implements $WeatherDescriptionModelCopyWith<$Res> {
  _$WeatherDescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherDescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDescriptionModelImplCopyWith<$Res>
    implements $WeatherDescriptionModelCopyWith<$Res> {
  factory _$$WeatherDescriptionModelImplCopyWith(
          _$WeatherDescriptionModelImpl value,
          $Res Function(_$WeatherDescriptionModelImpl) then) =
      __$$WeatherDescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String main, String description});
}

/// @nodoc
class __$$WeatherDescriptionModelImplCopyWithImpl<$Res>
    extends _$WeatherDescriptionModelCopyWithImpl<$Res,
        _$WeatherDescriptionModelImpl>
    implements _$$WeatherDescriptionModelImplCopyWith<$Res> {
  __$$WeatherDescriptionModelImplCopyWithImpl(
      _$WeatherDescriptionModelImpl _value,
      $Res Function(_$WeatherDescriptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherDescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? main = null,
    Object? description = null,
  }) {
    return _then(_$WeatherDescriptionModelImpl(
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDescriptionModelImpl implements _WeatherDescriptionModel {
  const _$WeatherDescriptionModelImpl(
      {required this.main, required this.description});

  factory _$WeatherDescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDescriptionModelImplFromJson(json);

  @override
  final String main;
  @override
  final String description;

  @override
  String toString() {
    return 'WeatherDescriptionModel(main: $main, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDescriptionModelImpl &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, main, description);

  /// Create a copy of WeatherDescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDescriptionModelImplCopyWith<_$WeatherDescriptionModelImpl>
      get copyWith => __$$WeatherDescriptionModelImplCopyWithImpl<
          _$WeatherDescriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherDescriptionModel implements WeatherDescriptionModel {
  const factory _WeatherDescriptionModel(
      {required final String main,
      required final String description}) = _$WeatherDescriptionModelImpl;

  factory _WeatherDescriptionModel.fromJson(Map<String, dynamic> json) =
      _$WeatherDescriptionModelImpl.fromJson;

  @override
  String get main;
  @override
  String get description;

  /// Create a copy of WeatherDescriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDescriptionModelImplCopyWith<_$WeatherDescriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
