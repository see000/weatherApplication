// extensions/weather_state_extensions.dart

import '../../constants/enums/weather_state.dart';
import '../../data/models/weather.dart';

extension WeatherStateString on WeatherState {
  String toWeatherStateString() {
    switch (this) {
      case WeatherState.clearSky:
        return 'Clear Sky';
      case WeatherState.partlyCloudy:
        return 'Partly Cloudy';
      case WeatherState.foggy:
        return 'Foggy';
      case WeatherState.drizzle:
        return 'Drizzle';
      case WeatherState.freezingDrizzle:
        return 'Freezing Drizzle';
      case WeatherState.rain:
        return 'Rain';
      case WeatherState.freezingRain:
        return 'Freezing Rain';
      case WeatherState.snowFall:
        return 'Snow Fall';
      case WeatherState.snowGrains:
        return 'Snow Grains';
      case WeatherState.rainShowers:
        return 'Rain Showers';
      case WeatherState.snowShowers:
        return 'Snow Showers';
      case WeatherState.thunderstorm:
        return 'Thunderstorm';
      case WeatherState.unknown:
        return 'Unknown';
    }
  }
}
