// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color backgroundColor;
  final String label;
  final Color labelColor;
  const CustomButton({
    Key? key,
    required this.backgroundColor,
    required this.labelColor,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins',
            color: labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
