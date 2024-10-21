import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/application/weather/search_weather_cubit.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeFiveSearchScreen extends StatefulWidget {
  PracticeFiveSearchScreen({super.key});

  static const String path = '/practice-five-search';
  static const String name = 'Practice Five Search';

  @override
  State<PracticeFiveSearchScreen> createState() =>
      _PracticeFiveSearchScreenState();
}

class _PracticeFiveSearchScreenState extends State<PracticeFiveSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SearchWeatherCubit, SearchWeatherState>(
          builder: (context, state) {
            return Column(
              children: [
                10.h.spaceSize,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onSubmitted: (value) {
                            context
                                .read<SearchWeatherCubit>()
                                .searchWeather(value);
                          },
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            ),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ],
                  ),
                ),
                15.h.spaceSize,
                if (state is SearchWeatherLoading)
                  const Center(child: CircularProgressIndicator()),
                if (state is SearchWeatherError)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.exception.message),
                        TextButton(
                          onPressed: () {
                            context
                                .read<SearchWeatherCubit>()
                                .retrySearch(_searchController.text);
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                if (state is SearchWeatherSearched)
                  Expanded(
                    child: (state.weathers.isEmpty)
                        ? Center(
                            child: 'No result'.size20,
                          )
                        : ListView.builder(
                            itemCount: state.weathers.length,
                            itemBuilder: (context, index) {
                              final weather = state.weathers[index];
                              return ListTile(
                                title: Text(
                                  weather.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                subtitle: Text(weather.country)
                                    .color(Colors.grey[600]!),
                                onTap: () {
                                  Navigator.pop(context, weather.id);
                                },
                              );
                            },
                          ),
                  ),
                if (state is SearchWeatherInitial)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.weathers.length,
                      itemBuilder: (context, index) {
                        final item = state.weathers[index];
                        return ListTile(
                          title: Text(item),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context
                                  .read<SearchWeatherCubit>()
                                  .deleteSearchHistory(item);
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
