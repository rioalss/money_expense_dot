import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If cleared, return empty text
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all non-numeric characters
    final numericString = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format as currency
    final formattedString = _formatter.format(int.parse(numericString));

    return TextEditingValue(
      text: formattedString,
      selection: TextSelection.collapsed(offset: formattedString.length),
    );
  }
}

class NumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove non-numeric characters
    final numericString = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Return the updated value
    return TextEditingValue(
      text: numericString,
      selection: TextSelection.collapsed(offset: numericString.length),
    );
  }
}
