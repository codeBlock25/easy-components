part of widget_utility;

extension ToString on DateTime {
  String fromDateToString() {
    final DateFormat customTimeFormat = DateFormat('dd MMMM, yyyy HH:mm');
    return customTimeFormat.format(add(const Duration(hours: 1)));
  }
}

extension ToDatePrecision on DateTime {
  String toPrecision({String? prefix = 'in the nest', String? suffix = 'ago'}) {
    final DateTime _dateTime = DateTime.now();
    final _difference = difference(_dateTime);
    if (isAfter(_dateTime)) {
      if (_difference <= const Duration(minutes: 1)) {
        return 'now';
      } else if (_difference >= const Duration(minutes: 1)) {
        return '$prefix ${_difference.inMinutes}';
      } else if (_difference >= const Duration(hours: 1)) {
        return '$prefix  ${_difference.inHours}';
      } else if (_difference >= const Duration(days: 1)) {
        return '$prefix  ${_difference.inDays}';
      } else {
        return 'on ${DateFormat.yMMMd().format(this)}';
      }
    } else if (isBefore(_dateTime)) {
      if (_difference <= const Duration(minutes: 1)) {
        return 'now';
      } else if (_difference >= const Duration(minutes: 1)) {
        return '${_difference.inMinutes} $suffix';
      } else if (_difference >= const Duration(hours: 1)) {
        return '${_difference.inHours} $suffix';
      } else if (_difference >= const Duration(days: 1)) {
        return '${_difference.inDays} $suffix';
      } else {
        return 'on ${DateFormat.yMMMd().format(this)}';
      }
    } else {
      return 'on ${DateFormat.yMMMd().format(this)}';
    }
  }
}
