part of widget_utility;

extension IntHelper on double {
  String get toMoney => '₦${toStringAsFixed(2)}';
}
