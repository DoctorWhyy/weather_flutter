import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/ui/screens/weather/bloc/weather_event.dart';
import 'package:weather_app/ui/screens/weather/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FindWeatherByCityNameRequested) {
      yield WeatherLoadInProgress();
      try {
        final weather =
            await weatherRepository.getWeather(event.cityName, null, null);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    } else if (event is FindWeatherByGeoLocationClicked) {
      await weatherRepository.getWeather(null, event.latitude, event.longitude);
      //yield WeatherLoadSuccess(weather: weather);
    }
  }
}
