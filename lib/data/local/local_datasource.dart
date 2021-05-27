import 'dart:math';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/local/model/weather.dart';
import 'dart:async';

import 'package:weather_app/data/local/model/weather.dart';

class LocalDataSource {
  static void initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<WeatherHiveModel>(WeatherHiveModelAdapter());
    await Hive.openBox<WeatherHiveModel>(WeatherHiveModel.boxKey);
  }

  Future<bool> hasData() async {
    final weatherBox = Hive.box<WeatherHiveModel>(WeatherHiveModel.boxKey);

    return weatherBox.length > 0;
  }

  //storage downloaded weather for all cities with index
  Future<void> saveWeather(Iterable<WeatherHiveModel> weather) async {
    final weatherBox = Hive.box<WeatherHiveModel>(WeatherHiveModel.boxKey);
    await weatherBox.putAll(Map.fromIterable(weather));
  }

  Future<void> refreshWeather(WeatherHiveModel weather) async {
    final weatherBox = Hive.box<WeatherHiveModel>(WeatherHiveModel.boxKey);
    weatherBox.clear();
    await weatherBox.put(weatherBox.length + 1, weather);
  }

  Future<List<WeatherHiveModel>> getWeatherList() async {
    final weatherBox = Hive.box<WeatherHiveModel>(WeatherHiveModel.boxKey);
    final totalWeather = weatherBox.length;

    return List.generate(totalWeather, (index) => weatherBox.getAt(0));
  }

  /*Future<WeatherHiveModel> getWeatherDetails(int index) async {
    final weatherBox = Hive.box<WeatherHiveModel>(WeatherHiveModel.boxKey);

    final WeatherHiveModel = weatherBox.

  }*/
}
