import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/weather.dart';
import '../../../common_widgets/circular_progress_indicator.dart';
import '../bloc/check_weather_bloc.dart';
import 'forecast_card.dart';

WeatherForecast forcast = WeatherForecast(
    apparentTemperature: 10.0,
    humidity: 20,
    temperature: 20.0,
    date: DateTime.now(),
    weatherState: WeatherState.clearSky,
    windSpeed: 20.0);

List<WeatherForecast> forecastList = List.generate(10, (index) => forcast);

// Generate dummy data for Weather class
Weather dummyWeather = Weather(
    longitude: '-74.006',
    latitude: '40.7128',
    locationAreaName: 'Kuala Lumpur',
    lastUpdated: DateTime.now(),
    backgroundImage: 'assets/images/backgrounds/night.jpg',
    weatherForecast: forecastList);

class ForcastList extends StatelessWidget {
  const ForcastList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 500,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0XFF535353),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
            builder: (context, state) {
          return _buildForecastCardList(state);
        }));
  }

  Widget _buildForecastCardList(CheckWeatherState state) {
    if(state.status == CheckWeatherStatus.initial) {
      return Container();
    }
    else if (state.status == CheckWeatherStatus.error) {
      return const Text('To access the weather forecast:\n\nEnable your GPS or save a specific location.', style: TextStyle(),textAlign: TextAlign.center,);
    }
    else if (state.status == CheckWeatherStatus.loading) {
      return  circularProgressIndicator();
    } else if (state.status == CheckWeatherStatus.loaded) {

      if(state.weather == null) return Container();
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.weather!.weatherForecast.length,
        itemBuilder: (context, index) {
          return ForcastCard(weatherForecast: state.weather!.weatherForecast[index]);
        },
      );
    } else {
      return Container();
    }
  }
}
