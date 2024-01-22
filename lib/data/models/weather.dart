import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:weather_application/utils/services/wmo_service.dart';

part 'weather.g.dart';

@HiveType(typeId: 3)
enum WeatherState {
  @HiveField(0)
  clearSky,
  
  @HiveField(1)
  partlyCloudy,
  
  @HiveField(2)
  foggy,
  
  @HiveField(3)
  drizzle,
  
  @HiveField(4)
  freezingDrizzle,
  
  @HiveField(5)
  rain,
  
  @HiveField(6)
  freezingRain,
  
  @HiveField(7)
  snowFall,
  
  @HiveField(8)
  snowGrains,
  
  @HiveField(9)
  rainShowers,
  
  @HiveField(10)
  snowShowers,
  
  @HiveField(11)
  thunderstorm,
  
  @HiveField(12)
  unknown,
}


@HiveType(typeId: 0) // The typeId should be unique across all HiveObject classes
class Weather extends HiveObject {
  @HiveField(0)
  final String latitude;

  @HiveField(1)
  final String longitude;

  @HiveField(2)
  final String locationAreaName;

  @HiveField(3)
  final DateTime lastUpdated;

  @HiveField(4)
  final String backgroundImage;

  @HiveField(5)
  final List<WeatherForecast> weatherForecast;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.locationAreaName,
    required this.lastUpdated,
    required this.backgroundImage,
    required this.weatherForecast,
  });

  factory Weather.fromJson({required String latitude ,required String longitude, required String locationAreaName, String backgroundImage = '' ,required Map<String, dynamic> weatherAPIResponseJsonObject}) {
    final List<WeatherForecast> forecasts =
        WeatherForecast.generateForecastListFromJson(weatherAPIResponseJsonObject);

    return Weather(
      latitude: latitude,
      longitude: longitude,
      locationAreaName: locationAreaName,
      lastUpdated: DateTime.now(),
      backgroundImage: backgroundImage,
      weatherForecast: forecasts,
    );
  }
  
  
 
  //toString method to print the weather object
  @override
  String toString() {
    return 'Weather{latitude: $latitude, longitude: $longitude, locationAreaName: $locationAreaName, lastUpdated: $lastUpdated, backgroundImage: $backgroundImage, weatherForecast: $weatherForecast}';
  }
}

@HiveType(typeId: 1) // The typeId should be unique across all HiveObject classes
class WeatherForecast extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final WeatherState weatherState;

  @HiveField(2)
  final double temperature;

  @HiveField(3)
  final double apparentTemperature;

  @HiveField(4)
  final int humidity;

  @HiveField(5)
  final double windSpeed;

  WeatherForecast({
    required this.date,
    required this.weatherState,
    required this.temperature,
    required this.apparentTemperature,
    required this.humidity,
    required this.windSpeed,
  });

  static List<WeatherForecast> generateForecastListFromJson(Map<String, dynamic> weatherAPIResponseJsonObject) {
   
    final dailyJson = weatherAPIResponseJsonObject['daily'];
    final hourlyJson = weatherAPIResponseJsonObject['hourly'];

    List<String> time = List<String>.from(dailyJson['time']) ;
    List<int> weatherCode = List<int>.from(dailyJson['weather_code']) ;

    List<double> temperature2mMax =
        List<double>.from(dailyJson['temperature_2m_max']) ;
    List<double> apparentTemperatureMax =
        List<double>.from( dailyJson['apparent_temperature_max']);
    List<double> windSpeed10mMax =
        List<double>.from(dailyJson['wind_speed_10m_max']) ;
    List<int> relativeHumidity2m =
        List<int>.from(hourlyJson['relative_humidity_2m']) ;

    final List<WeatherForecast> weatherForecasts = [];

    for (int i = 0; i < time.length; i++) {
      List<int> humidityOneDay = [];

      for (int j = 0; j < 24; j++) {
        humidityOneDay.add(relativeHumidity2m[i * 24 + j]);
      }
      
      final date = DateTime.parse(time[i]);
      final weatherState = weatherCode[i];
      final temperature = temperature2mMax[i];
      final apparentTemperature = apparentTemperatureMax[i];
      final windSpeed = windSpeed10mMax[i];

      // Calculate average humidity for each hour
      final averageHumidity = getAverage(humidityOneDay);

      final weatherForecast = WeatherForecast(
        date: date,
        weatherState: WMOService.interpretWMOCode(weatherState),
        temperature: temperature,
        apparentTemperature: apparentTemperature,
        humidity: averageHumidity,
        windSpeed: windSpeed,
      );

      weatherForecasts.add(weatherForecast);
    }

    return weatherForecasts;
  }

  //toString method to print the weather object
  @override
  String toString() {
    return 'WeatherForecast{date: $date, weatherState: $weatherState, temperature: $temperature, apparentTemperature: $apparentTemperature, humidity: $humidity, windSpeed: $windSpeed}';
  }
}

int getAverage(List<int> list) {
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }

  return sum ~/ list.length;
}

final jsonResponse = {
  "latitude": 2.375,
  "longitude": 112.5,
  "generationtime_ms": 0.0699758529663086,
  "utc_offset_seconds": 0,
  "timezone": "GMT",
  "timezone_abbreviation": "GMT",
  "elevation": 272.0,
  "hourly_units": {"time": "iso8601", "relative_humidity_2m": "%"},
  "hourly": {
    "time": [
      "2023-11-21T00:00",
      "2023-11-21T01:00",
      "2023-11-21T02:00",
      "2023-11-21T03:00",
      "2023-11-21T04:00",
      "2023-11-21T05:00",
      "2023-11-21T06:00",
      "2023-11-21T07:00",
      "2023-11-21T08:00",
      "2023-11-21T09:00",
      "2023-11-21T10:00",
      "2023-11-21T11:00",
      "2023-11-21T12:00",
      "2023-11-21T13:00",
      "2023-11-21T14:00",
      "2023-11-21T15:00",
      "2023-11-21T16:00",
      "2023-11-21T17:00",
      "2023-11-21T18:00",
      "2023-11-21T19:00",
      "2023-11-21T20:00",
      "2023-11-21T21:00",
      "2023-11-21T22:00",
      "2023-11-21T23:00",
      "2023-11-22T00:00",
      "2023-11-22T01:00",
      "2023-11-22T02:00",
      "2023-11-22T03:00",
      "2023-11-22T04:00",
      "2023-11-22T05:00",
      "2023-11-22T06:00",
      "2023-11-22T07:00",
      "2023-11-22T08:00",
      "2023-11-22T09:00",
      "2023-11-22T10:00",
      "2023-11-22T11:00",
      "2023-11-22T12:00",
      "2023-11-22T13:00",
      "2023-11-22T14:00",
      "2023-11-22T15:00",
      "2023-11-22T16:00",
      "2023-11-22T17:00",
      "2023-11-22T18:00",
      "2023-11-22T19:00",
      "2023-11-22T20:00",
      "2023-11-22T21:00",
      "2023-11-22T22:00",
      "2023-11-22T23:00",
      "2023-11-23T00:00",
      "2023-11-23T01:00",
      "2023-11-23T02:00",
      "2023-11-23T03:00",
      "2023-11-23T04:00",
      "2023-11-23T05:00",
      "2023-11-23T06:00",
      "2023-11-23T07:00",
      "2023-11-23T08:00",
      "2023-11-23T09:00",
      "2023-11-23T10:00",
      "2023-11-23T11:00",
      "2023-11-23T12:00",
      "2023-11-23T13:00",
      "2023-11-23T14:00",
      "2023-11-23T15:00",
      "2023-11-23T16:00",
      "2023-11-23T17:00",
      "2023-11-23T18:00",
      "2023-11-23T19:00",
      "2023-11-23T20:00",
      "2023-11-23T21:00",
      "2023-11-23T22:00",
      "2023-11-23T23:00",
      "2023-11-24T00:00",
      "2023-11-24T01:00",
      "2023-11-24T02:00",
      "2023-11-24T03:00",
      "2023-11-24T04:00",
      "2023-11-24T05:00",
      "2023-11-24T06:00",
      "2023-11-24T07:00",
      "2023-11-24T08:00",
      "2023-11-24T09:00",
      "2023-11-24T10:00",
      "2023-11-24T11:00",
      "2023-11-24T12:00",
      "2023-11-24T13:00",
      "2023-11-24T14:00",
      "2023-11-24T15:00",
      "2023-11-24T16:00",
      "2023-11-24T17:00",
      "2023-11-24T18:00",
      "2023-11-24T19:00",
      "2023-11-24T20:00",
      "2023-11-24T21:00",
      "2023-11-24T22:00",
      "2023-11-24T23:00"
    ],
    "relative_humidity_2m": [
      94,
      89,
      85,
      80,
      75,
      72,
      78,
      79,
      82,
      88,
      92,
      96,
      97,
      97,
      97,
      98,
      98,
      99,
      100,
      100,
      100,
      100,
      100,
      99,
      94,
      92,
      91,
      87,
      83,
      85,
      87,
      86,
      89,
      92,
      94,
      97,
      97,
      98,
      98,
      98,
      98,
      98,
      98,
      98,
      99,
      99,
      99,
      99,
      92,
      86,
      82,
      78,
      76,
      75,
      78,
      80,
      84,
      86,
      92,
      95,
      96,
      97,
      97,
      98,
      98,
      99,
      99,
      99,
      99,
      99,
      99,
      98,
      94,
      90,
      89,
      86,
      81,
      79,
      78,
      79,
      80,
      83,
      91,
      93,
      96,
      97,
      97,
      97,
      97,
      97,
      97,
      98,
      99,
      99,
      98,
      96
    ]
  },
  "daily_units": {
    "time": "iso8601",
    "weather_code": "wmo code",
    "temperature_2m_max": "°C",
    "apparent_temperature_max": "°C",
    "wind_speed_10m_max": "km/h"
  },
  "daily": {
    "time": ["2023-11-21", "2023-11-22", "2023-11-23", "2023-11-24"],
    "weather_code": [95, 96, 95, 95],
    "temperature_2m_max": [29.6, 28.6, 29.3, 29.1],
    "apparent_temperature_max": [35.2, 35.4, 35.6, 35.7],
    "wind_speed_10m_max": [6.1, 10.0, 8.0, 5.4]
  }
};
