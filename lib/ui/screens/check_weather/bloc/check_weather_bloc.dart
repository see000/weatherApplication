// a bloc check weather event file

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/weather.dart';
import '../../../../data/repository/weather_repository.dart';


part 'check_weather_event.dart';
part 'check_weather_state.dart';

class CheckWeatherBloc extends Bloc<CheckWeatherEvent, CheckWeatherState> {
  final WeatherRepository weatherRepository;
  
  CheckWeatherBloc({required this.weatherRepository}) : super(const CheckWeatherState()){

    on<GetWeather>(_mapGetWeatherToState);
  }

  void _mapGetWeatherToState(GetWeather event, Emitter<CheckWeatherState> emit) async {
    emit(state.copyWith(status: CheckWeatherStatus.loading));
    try {

      final weather = await weatherRepository.fetchWeather(latitude: 3.1073, longitude: 101.6067);
      emit(state.copyWith(status: CheckWeatherStatus.loaded, weather: weather));
    } catch (e) {
      emit(state.copyWith(status: CheckWeatherStatus.error, errorMessage: e.toString()));
    }

  }


}
