part of 'search_weather_cubit.dart';

sealed class SearchWeatherState extends Equatable {
  const SearchWeatherState();
}

final class SearchWeatherSearched extends SearchWeatherState {
  List<SearchWeatherModel> weathers;

  @override
  List<Object> get props => [weathers];

  SearchWeatherSearched({
    required this.weathers,
  });
}

final class SearchWeatherInitial extends SearchWeatherState {
  List<String> weathers;

  @override
  List<Object> get props => [weathers];

  SearchWeatherInitial({
    required this.weathers,
  });
}

final class SearchWeatherError extends SearchWeatherState {
  final AppDioException exception;

  @override
  List<Object> get props => [exception];

  const SearchWeatherError({
    required this.exception,
  });
}

final class SearchWeatherLoading extends SearchWeatherState {

  @override
  List<Object> get props => [];

}