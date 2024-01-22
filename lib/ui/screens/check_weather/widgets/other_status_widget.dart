import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/data/models/weather.dart';
import 'package:weather_application/ui/screens/check_weather/bloc/check_weather_bloc.dart';
import 'package:weather_application/utils/extensions/weather_state_extensions.dart';

import '../../../common_widgets/circular_progress_indicator.dart';

class OtherStatus extends StatefulWidget {
  const OtherStatus({super.key});

  @override
  State<OtherStatus> createState() => _OtherStatusState();
}

class _OtherStatusState extends State<OtherStatus> {
  late String status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
      builder: (context, state) {
        return _buildOtherStatus(context, state);
      }
    );
  }

  Widget _buildOtherStatus(BuildContext context, CheckWeatherState state) {
    if(state.status == CheckWeatherStatus.initial) {
      return Container();
    }
    else if (state.status == CheckWeatherStatus.error) {
      return Container();
    }
    else if (state.status == CheckWeatherStatus.loading) {
      return circularProgressIndicator();
    } else if (state.status == CheckWeatherStatus.loaded) {
      if(state.weather == null) return Container();
      return _buildOtherStatusDetails(context, state.weather!.weatherForecast[0]);
    }
    return Container();
  }

  Widget _buildOtherStatusDetails(BuildContext context, WeatherForecast weatherForecast) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: _buildStatusIcon(context,
                icon: Icons.water_drop_outlined,
                status: 'HUMINITY',
                value: weatherForecast.humidity.toString()),
          ),
          Expanded(
            child: _buildStatusIcon(context,
                icon: Icons.wind_power_outlined,
                status: 'WIND',
                value: '${weatherForecast.windSpeed} km/h'),
          ),
          Expanded(
            child: _buildStatusIcon(context,
                icon: Icons.thermostat_outlined,
                status: 'FEELS LIKE',
                value: weatherForecast.apparentTemperature.toString()),
          ),
        ],
      );
  }
}

Widget _buildStatusIcon(BuildContext context,
    {required IconData icon, required String status, required String value}) {
  return LayoutBuilder(

    builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: constraints.maxHeight * 0.5 ,
          ),
          Text(
            
            status,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontSize: constraints.maxHeight * 0.18,),
          ),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontSize: constraints.maxHeight * 0.18,)),
        ],
      );
    }
  );
}