// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class LinkText extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final double? fontSize;
  const LinkText({
    Key? key,
    this.onTap,
    required this.label,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: ColorName.primary,
        ),
      ),
    );
  }
}
