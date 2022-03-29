import 'dart:math';

class OdometerModel {
  int value;
  String unit;
  
  @override
  String toString() {
    return value.toString() + " " + unit;
  }

  OdometerModel({required this.value, this.unit="km"});
}