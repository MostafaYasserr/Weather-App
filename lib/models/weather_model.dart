class WeatherModel {
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  final String cityName;
  final DateTime date;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final String weatherDescription;
  final  String weatherIcon;

  factory WeatherModel.fromJson(dynamic data){
    return WeatherModel(
      cityName: data['location']['name'],
      date: DateTime.parse(data['current']['last_updated']),
      temperature: data['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemperature: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemperature: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherDescription: data['current']['condition']['text'],
      weatherIcon: data['current']['condition']['icon'],
    );
  }
}
