part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.error({required AppDioException exception, required String cityId}) = Error;
  const factory WeatherState.initial({required WeatherModel weatherModel, required bool isLoading}) = Success;
}
