import 'package:hive/hive.dart';
import 'package:weather_app/data/remote/model/weather.dart';

part 'weather.g.dart';

@HiveType(typeId: 1)
class WeatherHiveModel extends HiveObject {
  static const String boxKey = 'weather';

  @HiveField(0)
  String formattedCondition;

  @HiveField(1)
  double minTemp;

  @HiveField(2)
  double temp;

  @HiveField(3)
  double maxTemp;

  @HiveField(4)
  int locationId;

  @HiveField(5)
  String created;

  @HiveField(6)
  DateTime lastUpdated;

  @HiveField(7)
  String location;

  @HiveField(8)
  DateTime applicableDate;

  @HiveField(9)
  List<Weather> forecast;
}
