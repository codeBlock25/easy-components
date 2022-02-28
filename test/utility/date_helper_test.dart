import 'package:flutter_test/flutter_test.dart';
import 'package:widget_helper/widget_helper.dart';

void main() {
  test('Time string to DateTime and back', () {
    var date = DateTime.now().fromDateToString().toDate(native: true);

    expect(date.runtimeType, DateTime);
  });

  test('Time to precision should to now', () {
    final otherDate = DateTime.now();

    var precisionString = otherDate.toPrecision();

    expect(precisionString, 'now');
  });

  test('Time to precision should to come in minutes', () {
    final otherDate = DateTime.now().add(const Duration(minutes: 5));

    var precisionString = otherDate.toPrecision(prefix: 'In the next');

    expect(precisionString, 'In the next 4');
  });

  test('Time to precision should to come in minutes and as a string', () {
    final otherDate = DateTime.now().add(const Duration(minutes: 5));

    var precisionString = otherDate.toPrecision();

    expect(precisionString.runtimeType, String);
    expect(precisionString.contains('4'), true);
  });
}
