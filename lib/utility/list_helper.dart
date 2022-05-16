part of widget_utility;

int _sumUp(List<int> s) {
  int sum = 0;
  for (int i = 0; i < s.length; i++) {
    sum += s[i];
  }
  return sum;
}

extension IntListHelper on List<int> {
  int get sumUp => _sumUp(this);
}
