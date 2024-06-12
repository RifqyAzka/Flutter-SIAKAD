// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class SpDay extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const SpDay({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorName.primary : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: ColorName.primary),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorName.primary,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }
}
