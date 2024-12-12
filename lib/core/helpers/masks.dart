import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final cpfFormatter = MaskTextInputFormatter(
  mask: '###.###.###-##',
  filter: {"#": RegExp(r'[0-9]')},
);

String normalizeCPF(String cpf) {
  String cpfNumber = cpf.replaceAll(RegExp(r'[^0-9]'), '');
  return cpfNumber;
}

String normalizeNumber(String value) {
  String number = value.replaceAll(RegExp(r'[^0-9]'), '');
  return number;
}

final phoneFormatter = MaskTextInputFormatter(
  mask: '(##) #####-####',
  filter: {"#": RegExp(r'[0-9]')},
);

final plateFormatter = MaskTextInputFormatter(
  mask: '#######',
  filter: {"#": RegExp(r'[A-Za-z0-9]')},
);

final cepFormatter = MaskTextInputFormatter(
  mask: '#####-###',
  filter: {"#": RegExp(r'[0-9]')},
);

final dateFormatter = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
);

final numberFormatter = MaskTextInputFormatter(
  filter: {"#": RegExp(r'[0-9]')},
);
