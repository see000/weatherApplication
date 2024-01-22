import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/data/models/weather.dart';
import 'package:weather_application/ui/screens/check_weather/bloc/check_weather_bloc.dart';
import 'package:weather_application/ui/screens/check_weather/widgets/forecast_list.dart';
import 'package:weather_application/ui/screens/check_weather/widgets/other_status_widget.dart';
import 'package:weather_application/ui/screens/check_weather/widgets/selected_date_widget.dart';
import 'package:weather_application/ui/screens/check_weather/widgets/temperature_status_widget.dart';

import 'widgets/app_bar.dart';

class CheckWeatherScreen extends StatefulWidget {
  const CheckWeatherScreen({super.key});

  @override
  State<CheckWeatherScreen> createState() => _CheckWeatherScreenState();
}

class _CheckWeatherScreenState extends State<CheckWeatherScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckWeatherBloc>(context).add(GetWeather());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // Background Image with Dark Overlay
        Image.asset(
          'assets/images/default_background.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: header(context),
          body: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * 0.1,
                child: SelectedDateWidget()),
               SizedBox(
                height: height * 0.3,
                 child: TemperatureStatus(),
               ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                height: height * 0.1,
                child: OtherStatus(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
    
              SizedBox(
                height: height * 0.2,
                child: ForcastList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
