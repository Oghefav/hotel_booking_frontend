import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-digit characters
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Insert '/' after the second digit
    if (newText.length > 2) {
      newText = newText.substring(0, 2) + '/' + newText.substring(2);
    }

    // Limit to 5 characters (MM/YY)
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

}