// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class DpListTitle extends StatelessWidget {
  final String role;
  const DpListTitle({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Dashboard $role",
          style: const TextStyle(
            color: ColorName.primary,
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Divider(
            color: ColorName.primary,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
