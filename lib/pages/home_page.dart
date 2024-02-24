import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if(state is WeatherInitialState){
            return NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return WeatherInfoBody(weather:state.weatherModel,);
          }else{
            return const Text('Oops there was an error 😔');
          }
        },
      ),
    );
  }
}
