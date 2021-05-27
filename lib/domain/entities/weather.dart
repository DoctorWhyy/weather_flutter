class WeatherEntity {
  WeatherEntity({
    this.description,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.cityName,
    this.applicableDate,
  });

  String description;
  double minTemp;
  double temp;
  double maxTemp;
  int locationId;
  String created;
  String lastUpdated;
  String cityName;
  String applicableDate;
}
