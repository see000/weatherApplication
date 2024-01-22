import 'package:hive/hive.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:weather_application/data/services/database_service.dart';

import '../models/weather.dart';

// This is a hive database provider that will provide the database instance to the repository
class DatabaseProvider {
  static const String databaseName = "WeatherBox"; // name of the database
  static const String weatherBoxName = "weather"; // name of the box
  static const String favouriteBoxName = "favourite"; // name of the box
  static const String favouriteKey = 'favourite_location';
  bool _isInitialized = false;
  // Singleton instance of the DatabaseProvider
  static final DatabaseProvider _instance =
      DatabaseProvider._privateConstructor();

  DatabaseProvider._privateConstructor();

  // Private constructor for the singleton pattern
  factory DatabaseProvider() {
    return _instance;
  }

  // Instance of the weather box collection
  late Box<Weather> _weatherBox;
  late Box<String> _favouriteBox;

  Future init() async {
    // Initialize Hive
    await Hive.initFlutter();

    if (!Hive.isBoxOpen(databaseName)) {
      // Initialize WeatherBox
      await BoxCollection.open(
        databaseName, // Name of your database
        {weatherBoxName, favouriteBoxName}, // Names of your boxes
      );
      
    }

    // Register adapter
    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(WeatherForecastAdapter());
    Hive.registerAdapter(WeatherStateAdapter());
    _isInitialized = true;
  }

  // Getter for the weatherBox property
  Future<Box<Weather>> get weatherBox async {
    // If the weather box collection is not created, create and return it

    if (!_isInitialized) {
      await init();
    }

    if (Hive.isBoxOpen(weatherBoxName) == false) {
      _weatherBox = await Hive.openBox(weatherBoxName);
      return _weatherBox;
    } else {
      _weatherBox = Hive.box<Weather>(weatherBoxName);
      return _weatherBox;
    }
  }

  // Getter for the favouriteBox property
  Future<Box<String>> get favouriteBox async {
    // If the favourite box collection is not created, create and return it
    if (!_isInitialized) {
      await init();
    }

    if (Hive.isBoxOpen(favouriteBoxName) == false) {
      _favouriteBox = await Hive.openBox(favouriteBoxName);
      return _favouriteBox;
    } else {
      _favouriteBox = Hive.box<String>(favouriteBoxName);
      return _favouriteBox;
    }
  }

  String get favouriteBoxKey {
    return favouriteKey;
  }
}
