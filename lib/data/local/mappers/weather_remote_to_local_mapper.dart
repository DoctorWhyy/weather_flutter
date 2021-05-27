import 'package:weather_app/data/local/model/weather.dart';
import 'package:weather_app/data/remote/model/weather.dart';

extension RemoteToLocal on Weather {
  WeatherHiveModel toHiveModel() => WeatherHiveModel()
    ..locationId = locationId
    ..location = location?.trim() ?? ''
    ..lastUpdated = lastUpdated
    ..created = created
    ..applicableDate = applicableDate
    ..formattedCondition = formattedCondition
    ..maxTemp = maxTemp
    ..minTemp = minTemp
    ..temp = temp
    ..forecast = forecast;
}
