class GasPriceModel {
  double value;
  String gasType;
  String currency;
  String volumeUnit;

  @override
  String toString() {
    return gasType +
        ": " +
        currency +
        " " +
        value.toStringAsFixed(2) +
        "/" +
        volumeUnit;
  }

  GasPriceModel(
      {required this.value,
      required this.gasType,
      this.currency = "R\$",
      this.volumeUnit = "L"});
}
