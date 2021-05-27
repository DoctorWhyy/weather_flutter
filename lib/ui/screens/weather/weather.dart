import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

@immutable
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    Key key,
  }) : super(key: key);

  /// Для поиска _WeatherScreenState в контексте
  static _WeatherScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_WeatherScreenState>();

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'WeatherScreen StatefulWidget',
            ),
          ),
      );
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    // Первичная инициализация виджета
  }

  @override
  void didUpdateWidget(WeatherScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Конфигурация виджета изменилась
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Изменилась конфигурация InheritedWidget'ов
    // Также вызывается после initState, но до build'а
  }

  @override
  void dispose() {
    // Перманетное удаление стейта из дерева
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              '_WeatherScreenState State<WeatherScreen>',
            ),
          ),
      );

  Widget _tvTemperature() {
    final temperature = "asdf";
    return Text(temperature);
  }

  Widget _tvCityName() {
    final cityName = "asdf";
    return Text(cityName);
  }

  Widget _tvWindSpeed() {
    final windSpeed = "asdf";
    return Text(windSpeed);
  }

  Widget _buildCityWeatherListItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[_tvCityName(), _tvTemperature(), _tvWindSpeed()],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _buildCityWeatherListItem(),
        ),
      );
}
