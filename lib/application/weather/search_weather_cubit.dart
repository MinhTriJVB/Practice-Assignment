import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:practice/data/models/app_dio_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/weather_service.dart';
import '../../domain/model/search_weather_model.dart';

part 'search_weather_state.dart';

class SearchWeatherCubit extends Cubit<SearchWeatherState> {
  final weatherService = WeatherService();

  SearchWeatherCubit() : super(SearchWeatherInitial(weathers: const [])){
    onStart();
  }

  void searchWeather(String searchKey) async {
    await _saveSearchKey(searchKey);
    emit(SearchWeatherLoading());
    final weathers = await weatherService.searchCity(searchKey);

    weathers.fold((l) {
      emit(SearchWeatherError(exception: l));
    }, (r) {
      emit(SearchWeatherSearched(weathers: r));
    });
  }

  Future onStart() async {
    emit(SearchWeatherLoading());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _searchHistory = prefs.getStringList('search_history') ?? [];

    emit(SearchWeatherInitial(weathers: _searchHistory));
  }

  void retrySearch(String searchKey) {
    searchWeather(searchKey);
  }

  void deleteSearchHistory(String searchKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final _searchHistory = prefs.getStringList('search_history') ?? [];
    _searchHistory.remove(searchKey);


    prefs.setStringList('search_history', _searchHistory);
    emit(SearchWeatherInitial(weathers: _searchHistory));
  }

  Future<void> _saveSearchKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> searchHistory = prefs.getStringList('search_history') ?? [];

    if (searchHistory.contains(key)) {
      searchHistory.remove(key);
    }

    searchHistory.insert(0, key);

    await prefs.setStringList('search_history', searchHistory);
  }
}
