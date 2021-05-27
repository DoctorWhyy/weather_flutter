import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Weather {
  Weather(
      {this.formattedCondition,
      this.minTemp,
      this.temp,
      this.maxTemp,
      this.locationId,
      this.created,
      this.lastUpdated,
      this.location,
      this.applicableDate,
      this.forecast});

  String formattedCondition;
  double minTemp;
  double temp;
  double maxTemp;
  int locationId;
  String created;
  DateTime lastUpdated;
  String location;
  DateTime applicableDate;
  List<Weather> forecast;

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      formattedCondition: consolidatedWeather['weather_state_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastUpdated: DateTime.now(),
      applicableDate: consolidatedWeather['applicable_date'],
      location: json['title'],
    );
  }
}
