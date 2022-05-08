class OdometerModel {
  int value;
  String unit;

  @override
  String toString() {
    return value.toString() + " " + unit;
  }

  Object toObject() {
    return {"value": value, "unit": unit};
  }

  OdometerModel({required this.value, this.unit = "km"});
}
