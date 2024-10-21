import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    @Default("") String name,
    @Default("") String country,
    @Default("") String localtime,
  }) = _Location;
  
  

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Condition with _$Condition {
  const factory Condition({
    @Default("") String text,
    @Default("") String icon,
  }) = _Condition;
  
  

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
abstract class Current with _$Current {
  const factory Current({
    @Default(0.0) double temp_c,
    @Default(0.0) double wind_kph,
    @Default(0.0) double precip_mm,
    @Default(0) int humidity,
    @Default(Condition()) Condition condition,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
abstract class Day with _$Day {
  const factory Day({
    @Default(0.0) double maxtemp_c,
    @Default(0.0) double mintemp_c,
    @Default(0) int daily_chance_of_rain,

    @Default(Condition()) Condition condition,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) =>
      _$DayFromJson(json);
}

@freezed
class Hour with _$Hour {
  const factory Hour({
    @Default(0.0) double temp_c,
    @Default("") String time,
    @Default(Condition()) Condition condition,
  }) = _Hour;

  factory Hour.fromJson(Map<String, dynamic> json) =>
      _$HourFromJson(json);
}

@freezed
class ForecastDay with _$ForecastDay {
  const factory ForecastDay({
    @Default("") String date,
    @Default(Day()) Day day,
    @Default([]) List<Hour> hour,
  }) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    @JsonKey(name: 'forecastday') @Default([]) List<ForecastDay> forecastDay,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @Default(Location()) Location location,
    @Default(Current()) Current current,
    @Default(Forecast()) Forecast forecast,
  }) = _WeatherModel;
  
  

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}