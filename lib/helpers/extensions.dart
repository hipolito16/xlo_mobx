extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      multiLine: false,
    );
    return regex.hasMatch(this);
  }
}
