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

  GasStatsModel({required this.gasType, this.rate=0, this.distanceUnit="km", this.volumeUnit="L"});
}
