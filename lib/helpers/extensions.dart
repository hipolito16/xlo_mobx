import 'package:intl/intl.dart';

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

extension NumberExtension on num {
  String formattedMoney() {
    return NumberFormat('R\$###,##0.00', 'pt_BR').format(this);
  }
}

extension DateTimeExtension on DateTime {
  String formattedDate() {
    return DateFormat('dd/MM/yyyy HH:mm', 'pt_BR').format(this);
  }
}
