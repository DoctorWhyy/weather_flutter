import 'package:flutter/cupertino.dart';
import 'package:weather_app/config/constants.dart';
import 'package:weather_app/data/local/local_datasource.dart';
import 'package:weather_app/data/remote/api/weather_api_client.dart';
import 'package:weather_app/data/local/mappers/weather_remote_to_local_mapper.dart';
import 'package:weather_app/data/local/mappers/weather_local_to_entity_mapper.dart';
import 'package:weather_app/domain/entities/weather.dart';

class WeatherRepository {
  final WeatherApi weatherApiClient;
  final LocalDataSource localDataSource;

  WeatherRepository(
      {@required this.weatherApiClient, @required this.localDataSource})
      : assert(weatherApiClient != null);

  Future<List<WeatherEntity>> getWeather(
      String city, double lat, double lon) async {
    int locationId;

    if (city == null) {
      locationId = await weatherApiClient.getLocationIdByCoordinates(lat, lon);
    } else if (lat == null && lon == null) {
      locationId = await weatherApiClient.getLocationId(city);
    }

    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      var weathers = await weatherApiClient.fetchWeatherForecast(
          locationId, AppConstants.forecastDaysOffset);
      final weatherHiveModels = weathers.map((e) => e.toHiveModel());
      localDataSource.saveWeather(weatherHiveModels);
    }
    if (hasCachedData) {
      var weatherHiveModels = await localDataSource.getWeatherList();
      final weatherEntities = weatherHiveModels
          .where((element) => element != null)
          .map((e) => e.toEntity())
          .toList();

      return weatherEntities;
    }
  }
}

//class WeatherDetailsRepository extends WeatherRepository {}
