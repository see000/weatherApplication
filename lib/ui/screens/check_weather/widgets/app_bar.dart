import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/data/models/weather.dart';
import 'package:weather_application/data/services/hive_database_service.dart';
import 'package:weather_application/data/source/database_provider.dart';
import 'package:weather_application/ui/screens/check_weather/bloc/check_weather_bloc.dart';
import 'package:weather_application/ui/screens/check_weather/widgets/forecast_list.dart';

import '../../../../data/services/database_service.dart';
import '../../../../page_navigation.dart';
import '../../../common_widgets/circular_progress_indicator.dart';
import '../../add_location/add_new_location_screen.dart';

import '../../../../page_navigation.dart';
import '../../add_location/add_new_location_screen.dart';

AppBar header(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      children: [
        Icon(
          Icons.pin_drop_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 8), // Add some spacing between the icon and text
        BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
          builder: (context, state) {
            return _buildTitleText(state.status, state);
          }
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () async {
          navigateToPage(context, const SavedLocationsPage());
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    ],
  );
}


Widget _buildTitleText(CheckWeatherStatus status, CheckWeatherState state){
  switch (status) {
    case CheckWeatherStatus.loading:
      return circularProgressIndicator();
    case CheckWeatherStatus.loaded:
      if(state.weather == null) return const Text('');
      return Text(state.weather!.locationAreaName, style: TextStyle(color: Colors.white));
    case CheckWeatherStatus.error:
      return const Text('');
    default:
      return const Text('');
  }
}
