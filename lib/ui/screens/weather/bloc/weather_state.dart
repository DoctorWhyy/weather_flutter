import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final List<WeatherEntity> weather;

  const WeatherLoadSuccess({@required this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}

class TransitionToWeatherDetailsState extends WeatherState {}
