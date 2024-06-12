import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class KpTableRowWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  const KpTableRowWidget({
    super.key,
    required this.title,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 13.0,
    this.fontColor = ColorName.secondaryTextGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 6,
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fontColor,
            fontFamily: 'Poppins',
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
