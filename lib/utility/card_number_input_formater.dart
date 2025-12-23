import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  // Implementation of card number input formatting
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Format the card number as XXXX XXXX XXXX XXXX
    String newText = newValue.text.replaceAll(' ', '');
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formattedText += ' ';
      }
      formattedText += newText[i];
    }
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  } 
}