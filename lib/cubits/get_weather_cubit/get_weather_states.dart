import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  WeatherLoadedState({required this.weatherModel});
  final WeatherModel weatherModel;
}

class WeatherFailureState extends WeatherStates {}
