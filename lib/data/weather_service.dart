import 'package:dartz/dartz.dart';
import 'package:practice/data/base_service.dart';
import 'package:practice/data/models/app_dio_exception.dart';
import 'package:practice/domain/model/search_weather_model.dart';
import 'package:practice/domain/model/weather_model.dart';
import 'package:practice/utils/constants.dart';

class WeatherService extends BaseService {
  Future<Either<AppDioException, WeatherModel>> getWeather(
      String cityName) async {
    final response = await requestApi(
      path: API.forecast,
      method: Method.get,
      params: {
        'q': 'id:$cityName',
        'key': Constants.apiKey,
        'days': 7,
        'aqi': 'no',
        'alerts': 'no',
      },
    );
    return response.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right(WeatherModel.fromJson(r));
      },
    );
  }

  Future<Either<AppDioException, List<SearchWeatherModel>>> searchCity(String search) async {
    final response = await requestApi(
      path: API.search,
      method: Method.get,
      params: {
        'q': search,
        'key': Constants.apiKey,
      },
    );

    return response.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right((r as List).map((e) => SearchWeatherModel.fromJson(e),).toList());
      },
    );
  }
}
