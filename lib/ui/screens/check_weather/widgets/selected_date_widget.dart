import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/ui/screens/check_weather/bloc/check_weather_bloc.dart';

import '../../../../data/models/weather.dart';
import '../../../common_widgets/circular_progress_indicator.dart';

class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.5,
      child: BlocBuilder<CheckWeatherBloc, CheckWeatherState>(
        builder: (context, state) {
          return _buildSelectedDate(context, state);
        }
      ),
    );
  }

  Widget _buildSelectedDate(BuildContext context, CheckWeatherState state){
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
      return _buildSelectedDateDetails(context, state.weather!);
    }
    return Container();
  }


  Widget _buildSelectedDateDetails(BuildContext context, Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(DateFormat('MMMM dd').format(DateTime.now()),style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
        const SizedBox(height: 10,),
        Flexible(child: Text('Updated ${DateFormat('dd/MM/yyyy hh:mm a').format(weather.lastUpdated)}',style: Theme.of(context).textTheme.titleMedium,)),
      ],  );
  }
}