import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/ui/screens/check_weather/bloc/check_weather_bloc.dart';

import 'data/repository/weather_repository.dart';
import 'ui/screens/check_weather/check_weather_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CheckWeatherBloc>(
        create: (context) => CheckWeatherBloc(
          weatherRepository: WeatherRepository(),
        ),
      ),
   
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Typography.whiteMountainView
      ),
      home: const CheckWeatherScreen(),
    );
  }
}
