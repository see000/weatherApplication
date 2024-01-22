import 'package:weather_application/data/source/database_provider.dart';

import '../models/weather.dart';

abstract class DatabaseService{
  late DatabaseProvider databaseProvider;


  //// Weather Box ////
  
  Future<Weather?> getWeather();

  Future<List<Weather>?> getWeatherList();

  Future<void> saveOrUpdateWeather(Weather weather);

  //// Favourite Box ////

  Future<void> savePreferLocation(String locationName);

  Future<String?> getPreferLocation();

}

