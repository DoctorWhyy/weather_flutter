// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherHiveModelAdapter extends TypeAdapter<WeatherHiveModel> {
  @override
  final int typeId = 1;

  @override
  WeatherHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherHiveModel()
      ..formattedCondition = fields[0] as String
      ..minTemp = fields[1] as double
      ..temp = fields[2] as double
      ..maxTemp = fields[3] as double
      ..locationId = fields[4] as int
      ..created = fields[5] as String
      ..lastUpdated = fields[6] as DateTime
      ..location = fields[7] as String
      ..applicableDate = fields[8] as DateTime
      ..forecast = (fields[9] as List)?.cast<Weather>();
  }

  @override
  void write(BinaryWriter writer, WeatherHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.formattedCondition)
      ..writeByte(1)
      ..write(obj.minTemp)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.maxTemp)
      ..writeByte(4)
      ..write(obj.locationId)
      ..writeByte(5)
      ..write(obj.created)
      ..writeByte(6)
      ..write(obj.lastUpdated)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.applicableDate)
      ..writeByte(9)
      ..write(obj.forecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
