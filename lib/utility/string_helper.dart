part of widget_utility;

String _blank(String? v) {
  return v ?? 'blank';
}

extension StringNullUtility on String? {
  /// returns true if not empty else false
  bool has() {
    return this == null
        ? false
        : this == ''
            ? false
            : this != 'null';
  }

  String get blank => _blank(this);
}

extension StringUtility on String {
  bool has() {
    return replaceAll(' ', '') == ''
        ? false
        : this == ''
            ? false
            : this != 'null';
  }

  DateTime toDate({bool? native = false}) {
    return DateTime.parse(this);
  }

  String get getPhoneNumber {
    return isPhoneNumber
        ? '+${replaceAll("+", '')}'
        : "+234" + replaceAll(" ", '').substring((length - 10).abs());
  }

  bool get isCountry {
    _countries.map((String country) => country.toLowerCase()).toList();
    return _countries.contains(toLowerCase().trim());
  }
}
