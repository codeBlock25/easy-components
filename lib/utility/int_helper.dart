part of widget_utility;

extension IntNullHelper on int? {
  int get blank => this ?? 1;
}

extension IntHelper on int {
  String get toMoney => '₦${toDouble().toStringAsFixed(2)}';
}
