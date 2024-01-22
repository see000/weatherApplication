import 'package:path/path.dart';

import '../../constants/enums/weather_state.dart';
import '../../data/models/weather.dart';

class WMOService {
  static WeatherState interpretWMOCode(int wmoCode) {
    switch (wmoCode) {
      case 0:
      return WeatherState.clearSky;
    case 1:
    case 2:
    case 3:
      return WeatherState.partlyCloudy;
    case 45:
    case 48:
      return WeatherState.foggy;
    case 51:
    case 53:
    case 55:
      return WeatherState.drizzle;
    case 56:
    case 57:
      return WeatherState.freezingDrizzle;
    case 61:
    case 63:
    case 65:
      return WeatherState.rain;
    case 66:
    case 67:
      return WeatherState.freezingRain;
    case 71:
    case 73:
    case 75:
      return WeatherState.snowFall;
    case 77:
      return WeatherState.snowGrains;
    case 80:
    case 81:
    case 82:
      return WeatherState.rainShowers;
    case 85:
    case 86:
      return WeatherState.snowShowers;
    case 95:
    case 96:
    case 99:
      return WeatherState.thunderstorm;
    default:
      // Handle unknown codes, you might want to throw an exception or return a default state
      return WeatherState.unknown;
    }
  }

  // call this function to get the image related to the weather state code

  static String getWeatherImage(WeatherState weatherState) {
    DateTime now = DateTime.now();
    bool isDay = now.hour >= 6 && now.hour <= 18;

    String basePath = 'assets/images/weather_icons';

    switch (weatherState) {
      case WeatherState.clearSky:
        return join(basePath, 'Sunny.png');
      case WeatherState.partlyCloudy:
        String imageName =
            isDay ? 'PartlyCloudyDay.png' : 'PartlyCloudyNight.png';
        return join(basePath, imageName);
      case WeatherState.foggy:
        return join(basePath, 'Fog.png');
      case WeatherState.drizzle:
      case WeatherState.freezingDrizzle:
      case WeatherState.rain:
      case WeatherState.freezingRain:
        return join(basePath, 'HeavyRain.png');
      case WeatherState.snowFall:
      case WeatherState.snowGrains:
        return join(basePath, 'ModSnow.png');
      case WeatherState.rainShowers:
        return join(basePath, 'OccLightRain.png');
      case WeatherState.snowShowers:
        return join(basePath, 'ModSleet.png');
      case WeatherState.thunderstorm:
        return join(basePath, 'CloudRainThunder.png');
      default:
        return join(basePath, 'unknown.png');
    }
  }
}
