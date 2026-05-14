// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Weather {
  String get cityName => throw _privateConstructorUsedError;
  String get weatherState => throw _privateConstructorUsedError;
  String get weatherStateDescription => throw _privateConstructorUsedError;
  num get temperature => throw _privateConstructorUsedError;
  num get minTemperature => throw _privateConstructorUsedError;
  num get maxTemperature => throw _privateConstructorUsedError;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {String cityName,
      String weatherState,
      String weatherStateDescription,
      num temperature,
      num minTemperature,
      num maxTemperature});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? weatherState = null,
    Object? weatherStateDescription = null,
    Object? temperature = null,
    Object? minTemperature = null,
    Object? maxTemperature = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherState: null == weatherState
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateDescription: null == weatherStateDescription
          ? _value.weatherStateDescription
          : weatherStateDescription // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as num,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cityName,
      String weatherState,
      String weatherStateDescription,
      num temperature,
      num minTemperature,
      num maxTemperature});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? weatherState = null,
    Object? weatherStateDescription = null,
    Object? temperature = null,
    Object? minTemperature = null,
    Object? maxTemperature = null,
  }) {
    return _then(_$WeatherImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherState: null == weatherState
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateDescription: null == weatherStateDescription
          ? _value.weatherStateDescription
          : weatherStateDescription // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      minTemperature: null == minTemperature
          ? _value.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as num,
      maxTemperature: null == maxTemperature
          ? _value.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.cityName,
      required this.weatherState,
      required this.weatherStateDescription,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature});

  @override
  final String cityName;
  @override
  final String weatherState;
  @override
  final String weatherStateDescription;
  @override
  final num temperature;
  @override
  final num minTemperature;
  @override
  final num maxTemperature;

  @override
  String toString() {
    return 'Weather(cityName: $cityName, weatherState: $weatherState, weatherStateDescription: $weatherStateDescription, temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.weatherState, weatherState) ||
                other.weatherState == weatherState) &&
            (identical(
                    other.weatherStateDescription, weatherStateDescription) ||
                other.weatherStateDescription == weatherStateDescription) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName, weatherState,
      weatherStateDescription, temperature, minTemperature, maxTemperature);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String cityName,
      required final String weatherState,
      required final String weatherStateDescription,
      required final num temperature,
      required final num minTemperature,
      required final num maxTemperature}) = _$WeatherImpl;

  @override
  String get cityName;
  @override
  String get weatherState;
  @override
  String get weatherStateDescription;
  @override
  num get temperature;
  @override
  num get minTemperature;
  @override
  num get maxTemperature;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
