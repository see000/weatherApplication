import 'package:weather_application/data/services/database_service.dart';
import 'package:weather_application/data/source/database_provider.dart';

import '../models/weather.dart';

class HiveDatabaseService implements DatabaseService {

  HiveDatabaseService({required this.databaseProvider});
  
  @override
  DatabaseProvider databaseProvider;
  
  @override
  Future<Weather?> getWeather({String? locationName}) async {
    final weatherBox = await databaseProvider.weatherBox;
    Weather? result;

    if(locationName != null){
      result = weatherBox.get(locationName);
    }else{
      result = weatherBox.getAt(0);
    }
    
    return result;
  }
  
  @override
  Future<List<Weather>> getWeatherList() async {
    final weatherBox = await databaseProvider.weatherBox;
    return weatherBox.values.toList();
  }

  @override
  Future<void> saveOrUpdateWeather (Weather weather) async {
    final weatherBox = await databaseProvider.weatherBox;
    weatherBox.put(weather.locationAreaName, weather);

    print('Weather is inserted/ updated');
  }
  
  @override
  Future<void> savePreferLocation(String locationName) async {
    final favouriteBox = await databaseProvider.favouriteBox;
    favouriteBox.put(databaseProvider.favouriteBoxKey , locationName);
    print('Favourite location added');
  }
  
  @override
  Future<String?> getPreferLocation() async {
    final favouriteBox = await databaseProvider.favouriteBox;
    return favouriteBox.get(databaseProvider.favouriteBoxKey);
  }       

}