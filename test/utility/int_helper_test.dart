import 'package:flutter_test/flutter_test.dart';
import 'package:widget_helper/widget_helper.dart';

void main() {
  test('Convert int to Money', () {
    expect(1000.toMoney, '₦1000.00');
  });

  test('Convert int to Money as String', () {
    expect(1000.toMoney.runtimeType, String);
  });
}
