import 'package:weather_app/data/local/model/weather.dart';
import 'package:weather_app/domain/entities/weather.dart';

extension LocalToEntityX on WeatherHiveModel {
  WeatherEntity toEntity() => WeatherEntity()
    ..locationId = locationId
    ..temp = temp
    ..minTemp = minTemp
    ..maxTemp = maxTemp
    ..created = created
    ..lastUpdated =
        "${lastUpdated.day}/${lastUpdated.month}/${lastUpdated.year}"
    ..created = created
    ..description = formattedCondition
    ..applicableDate =
        "${lastUpdated.day}/${lastUpdated.month}/${lastUpdated.year}"
    ..cityName = location;
}
