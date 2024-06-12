import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/icons.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon.dart';

class DpAppBar extends StatelessWidget {
  const DpAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Selamat Datang",
          style: TextStyle(
            color: ColorName.primary,
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        SvgIcon(
          iconUrl: IconName.notificationOutline,
          height: 24,
          color: ColorName.primary,
        ),
      ],
    );
  }
}
