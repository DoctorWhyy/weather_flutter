import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:weather_app/data/remote/model/weather.dart';
import 'package:weather_app/util/date_util.dart';

class WeatherApi {
  static const baseUrl = "https://www.metaweather.com";

  final http.Client httpClient;

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<int> getLocationIdByCoordinates(double lat, double lon) async {
    final locationUrl = '$baseUrl/api/location/search/?lattlong=$lat,$lon';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));

    if (locationResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }

  //Not Implemented
  Future<List<Weather>> fetchCurrentWeather() {}

  Future<List<Weather>> fetchWeatherForecast(
      int locationId, int forecastDaysOffset) async {
    List<Weather> forecast = [];

    for (int i = 0; i < forecastDaysOffset; i++) {
      forecast.add(await fetchWeatherForecastDaily(locationId, i + 1));
    }

    return forecast;
  }

  Future<Weather> fetchWeatherForecastDaily(int locationId, int day) async {
    final formattedDate = offsetDateFormatter(day);

    final weatherUrl = '$baseUrl/api/location/$locationId/$formattedDate';

    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));
    final weatherJson = jsonDecode(weatherResponse.body);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    return Weather.fromJson(weatherJson);
  }

  WeatherApi({@required this.httpClient}) : assert(httpClient != null);
}
