import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/data/models/app_dio_exception.dart';
import 'package:practice/domain/model/weather_model.dart';

import '../../data/weather_service.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final service = WeatherService();

  WeatherBloc() : super(const WeatherState.initial(weatherModel: WeatherModel(), isLoading: true)) {
    on<WeatherEvent>((event, emit) async {
      await event.when(
        getWeather: (cityId) async {
          emit(const WeatherState.initial(isLoading: true, weatherModel: WeatherModel()));
          final response = await service.getWeather(cityId);

          response.fold(
            (l) {
              emit(WeatherState.error(exception: l, cityId: cityId));
            },
            (r) {
              emit(WeatherState.initial(weatherModel: r, isLoading: false));
            },
          );

        },
      );
    });
  }
}
