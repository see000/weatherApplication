import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/data/models/weather.dart';
import 'package:weather_application/ui/common_widgets/circular_progress_indicator.dart';
import 'package:weather_application/utils/extensions/weather_state_extensions.dart';
import 'package:weather_application/utils/services/wmo_service.dart';

import '../bloc/check_weather_bloc.dart';

class TemperatureStatus extends StatelessWidget {
  const TemperatureStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
      builder: (context, state) {
        return _buildTemperatureStatus(state);
      }
    );
  }

  Widget _buildTemperatureStatus (CheckWeatherState state){

    if(state.status == CheckWeatherStatus.initial) {
      return Container();
    }
    else if (state.status == CheckWeatherStatus.error) {
      return Container();
    }
    else if (state.status == CheckWeatherStatus.loading) {
      return Container();
    } else if (state.status == CheckWeatherStatus.loaded) {
      if(state.weather == null) return Container();
      return _buildTemperatureDetails(state.weather!.weatherForecast[0]);
    }
    return Container();
  }
  

  Widget _buildTemperatureDetails(WeatherForecast weatherForecast) {

    String weatherIconPath = WMOService.getWeatherImage(weatherForecast.weatherState);
   
    return LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
                child: LayoutBuilder(
                  builder: (context,constraints) {
                  
                    return SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxHeight,
                      child: Image.asset(
                        weatherIconPath,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    );
                  }
                ),
              ),
              
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      weatherForecast.weatherState.toWeatherStateString(),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          weatherForecast.temperature.toString(),
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '°C',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold,
                                ),
                            
                          ),
                        ),
        ],
      );
}
                ),
              )
            ],
          );
        }
      );
  }
}