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

  GasStatsModel(this.gasType, this.rate, this.distanceUnit, this.volumeUnit);
}
