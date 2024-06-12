// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class KpSemesterButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final bool isOutline;
  const KpSemesterButton({
    Key? key,
    this.onTap,
    required this.label,
    this.isOutline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: isOutline ? Colors.white : ColorName.primary,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: isOutline ? ColorName.greyBoxBorder : ColorName.primary,
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isOutline ? ColorName.primary : Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
