import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:(context) => BlocBuilder<GetWeatherCubit,WeatherStates>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherDescription),
                appBarTheme: AppBarTheme(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherDescription),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },

        ),
      ),
    );
  }
}
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition == 'Sunny' || condition == 'Clear') {
    return Colors.amber;
  } else if (condition == 'Partly cloudy') {
    return Colors.blue;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey;
  } else if (condition.contains('Rain')) {
    return Colors.indigo;
  } else if (condition.contains('Snow')) {
    return Colors.lightBlue;
  } else if (condition.contains('Thunder')) {
    return Colors.orange;
  } else if (condition.contains('Mist') || condition.contains('Fog')) {
    return Colors.grey;
  } else {
    return Colors.blue;
  }
}