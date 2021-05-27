import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FindWeatherByCityNameRequested extends WeatherEvent {
  final String cityName;

  const FindWeatherByCityNameRequested({@required this.cityName})
      : assert(cityName != null);

  @override
  List<Object> get props => [cityName];
}

class FindWeatherByGeoLocationClicked extends WeatherEvent {
  final double latitude, longitude;

  const FindWeatherByGeoLocationClicked(
      {@required this.latitude, @required this.longitude})
      : assert(longitude != null && latitude != null);

  @override
  List<Object> get props => [latitude, longitude];
}
