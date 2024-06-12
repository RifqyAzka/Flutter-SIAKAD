// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class ApDashLine extends StatelessWidget {
  final double width;
  const ApDashLine({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: 4,
          decoration: BoxDecoration(
            color: ColorName.text,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: width / 7,
          height: 4,
          decoration: BoxDecoration(
            color: ColorName.text,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
