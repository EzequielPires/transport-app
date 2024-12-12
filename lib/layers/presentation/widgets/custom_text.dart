import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String value;

  const CustomText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
