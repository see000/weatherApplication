part of 'check_weather_bloc.dart';

enum CheckWeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class CheckWeatherState extends Equatable {
  const CheckWeatherState({
    this.status = CheckWeatherStatus.initial,
    this.weather,
    this.errorMessage,
  });

  final CheckWeatherStatus status;
  final Weather? weather;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, weather, errorMessage];

  CheckWeatherState copyWith({
    CheckWeatherStatus? status,
    Weather? weather,
    String? errorMessage,
  }) {
    return CheckWeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

