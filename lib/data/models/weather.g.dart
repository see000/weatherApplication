// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 0;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      latitude: fields[0] as String,
      longitude: fields[1] as String,
      locationAreaName: fields[2] as String,
      lastUpdated: fields[3] as DateTime,
      backgroundImage: fields[4] as String,
      weatherForecast: (fields[5] as List).cast<WeatherForecast>(),
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.locationAreaName)
      ..writeByte(3)
      ..write(obj.lastUpdated)
      ..writeByte(4)
      ..write(obj.backgroundImage)
      ..writeByte(5)
      ..write(obj.weatherForecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherForecastAdapter extends TypeAdapter<WeatherForecast> {
  @override
  final int typeId = 1;

  @override
  WeatherForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherForecast(
      date: fields[0] as DateTime,
      weatherState: fields[1] as WeatherState,
      temperature: fields[2] as double,
      apparentTemperature: fields[3] as double,
      humidity: fields[4] as int,
      windSpeed: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherForecast obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weatherState)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.apparentTemperature)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.windSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherStateAdapter extends TypeAdapter<WeatherState> {
  @override
  final int typeId = 3;

  @override
  WeatherState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeatherState.clearSky;
      case 1:
        return WeatherState.partlyCloudy;
      case 2:
        return WeatherState.foggy;
      case 3:
        return WeatherState.drizzle;
      case 4:
        return WeatherState.freezingDrizzle;
      case 5:
        return WeatherState.rain;
      case 6:
        return WeatherState.freezingRain;
      case 7:
        return WeatherState.snowFall;
      case 8:
        return WeatherState.snowGrains;
      case 9:
        return WeatherState.rainShowers;
      case 10:
        return WeatherState.snowShowers;
      case 11:
        return WeatherState.thunderstorm;
      case 12:
        return WeatherState.unknown;
      default:
        return WeatherState.clearSky;
    }
  }

  @override
  void write(BinaryWriter writer, WeatherState obj) {
    switch (obj) {
      case WeatherState.clearSky:
        writer.writeByte(0);
        break;
      case WeatherState.partlyCloudy:
        writer.writeByte(1);
        break;
      case WeatherState.foggy:
        writer.writeByte(2);
        break;
      case WeatherState.drizzle:
        writer.writeByte(3);
        break;
      case WeatherState.freezingDrizzle:
        writer.writeByte(4);
        break;
      case WeatherState.rain:
        writer.writeByte(5);
        break;
      case WeatherState.freezingRain:
        writer.writeByte(6);
        break;
      case WeatherState.snowFall:
        writer.writeByte(7);
        break;
      case WeatherState.snowGrains:
        writer.writeByte(8);
        break;
      case WeatherState.rainShowers:
        writer.writeByte(9);
        break;
      case WeatherState.snowShowers:
        writer.writeByte(10);
        break;
      case WeatherState.thunderstorm:
        writer.writeByte(11);
        break;
      case WeatherState.unknown:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
