import '../models/weather.dart';
import '../source/weather_api_provider.dart';

class WeatherRepository {
  final weatherApiProvider = WeatherApiProvider();

  Future<Weather> fetchWeather({required double latitude, required double longitude}) async {
    return weatherApiProvider.fetchWeather(latitude, longitude);
  }

  // Future<List<Weather>> fetchSavedLocationsWeather() {
  //
  // }
}
