import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_weather_model.freezed.dart';
part 'search_weather_model.g.dart';

@freezed
class SearchWeatherModel with _$SearchWeatherModel {
  const factory SearchWeatherModel({
    required int id,
    required String name,
    required String country,
  }) = _SearchWeatherModel;
  
  

  factory SearchWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$SearchWeatherModelFromJson(json);
}