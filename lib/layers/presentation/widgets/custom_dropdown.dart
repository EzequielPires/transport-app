import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(Object?)? validator;
  final void Function(Object?)? onSelected;
  final List<DropdownMenuEntry<Object>> dropdownMenuEntries;
  final bool validatorEnabled;
  final Widget? prefixIcon;

  const CustomDropdown({
    super.key,
    required this.controller,
    required this.dropdownMenuEntries,
    this.label,
    this.hintText,
    this.inputFormatters,
    this.validator,
    this.onSelected,
    this.validatorEnabled = false,
    this.prefixIcon,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Object? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            : Container(),
        const SizedBox(height: 4),
        FormField<Object>(
          validator: widget.validator,
          autovalidateMode: widget.validatorEnabled
              ? AutovalidateMode.onUserInteraction
              : null,
          builder: (FormFieldState<Object> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu(
                  controller: widget.controller,
                  expandedInsets: const EdgeInsets.all(0),
                  hintText: widget.hintText ?? 'Selecione uma opção',
                  menuStyle: MenuStyle(
                    maximumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 400),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1,
                          color: state.hasError
                              ? Colors.red.shade900
                              : Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(width: 1, color: Colors.red.shade900),
                    ),
                  ),
                  leadingIcon: widget.prefixIcon,
                  onSelected: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                    state.didChange(value);
                    if (widget.onSelected != null) {
                      widget.onSelected!(value);
                    }
                  },
                  dropdownMenuEntries: widget.dropdownMenuEntries,
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 12),
                    child: Text(
                      state.errorText ?? '',
                      style:
                          TextStyle(color: Colors.red.shade900, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
