import 'package:flutter/material.dart';

class CustomDateInput extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onDateSelected;
  final bool validatorEnabled;

  const CustomDateInput({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.validator,
    this.onDateSelected,
    this.validatorEnabled = false,
  });

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          readOnly: true, // Impede que o usuário digite no campo
          decoration: InputDecoration(
            hintText: widget.hintText ?? 'Selecione uma data',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
            prefixIcon: const Icon(Icons.calendar_month_outlined),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Colors.black26),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Colors.black26),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Colors.black26),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
          validator: widget.validator,
          onTap: () async {
            final DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    dialogBackgroundColor: Colors.white,
                    scaffoldBackgroundColor: Colors.white,
                    colorScheme: const ColorScheme.light(
                      surface: Colors.white,
                    ),
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      size: Size(
                          double.infinity, MediaQuery.of(context).size.height),
                    ),
                    child: child!,
                  ),
                );
              },
            );
            if (selectedDate != null) {
              widget.controller.text =
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              if (widget.onDateSelected != null) {
                widget.onDateSelected!(selectedDate);
              }
            }
          },
        ),
      ],
    );
  }
}
