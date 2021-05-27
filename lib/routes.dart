import 'package:flutter/cupertino.dart';
import 'package:weather_app/core/fade_page_route.dart';
import 'package:weather_app/ui/screens/weather/weather.dart';
import 'package:weather_app/ui/screens/weather_deatail/weather_detail.dart';

enum Routes { weather, weather_detail }

class _Paths {
  static const String weather = '/weather';
  static const String weather_detail = '/weather_details';

  static const Map<Routes, String> _pathMap = {
    Routes.weather: _Paths.weather,
    Routes.weather_detail: _Paths.weather,
  };

  static String of(Routes route) => _pathMap[route];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.weather_detail:
        return FadeRoute(page: WeatherDetailScreen());

      case _Paths.weather:
      default:
        return FadeRoute(page: WeatherScreen());
    }
  }

  static Future push<T>(Routes route, [T arguments]) =>
      state.pushNamed(_Paths.of(route), arguments: arguments);

  static Future replaceWith<T>(Routes route, [T arguments]) =>
      state.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state.pop();

  static NavigatorState get state => navigatorKey.currentState;
}
