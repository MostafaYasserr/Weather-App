import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  WeatherService({required this.dio});
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1/forecast.json';
  final String apiKey = '247a5d733cd444a9ab0202444241902';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'something went wrong please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load weather data');
    }
  }
}

