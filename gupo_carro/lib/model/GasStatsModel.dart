class GasStatsModel {
  String gasType;
  double rate;
  String distanceUnit;
  String volumeUnit;
  
  @override
  String toString() {
    return gasType +
        ": " +
        rate.toStringAsFixed(2) +
        " " +
        distanceUnit +
        "/" +
        volumeUnit;
  }

  Object toObject() {
    return {
      "gasType": gasType,
      "rate": rate,
      "distanceUnit": distanceUnit,
      "volumeUnit": volumeUnit
    };
  }

  GasStatsModel({required this.gasType, this.rate=0, this.distanceUnit="km", this.volumeUnit="L"});
}
