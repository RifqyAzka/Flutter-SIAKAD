import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/link_text.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon.dart';
import 'package:flutter_fic8_final_g3/pages/auth/widgets/auth_page_widgets/ap_input_field.dart';
import 'package:flutter_fic8_final_g3/pages/auth/widgets/auth_page_widgets/ap_title.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgIcon(
              iconUrl: Images.topShape,
              width: screenWidth,
              color: ColorName.primary,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      child: Image.asset(Images.logo),
                    ),
                  ),
                  const Column(
                    children: [
                      ApTitle(),
                      SizedBox(height: 30),
                      ApInputField(),
                    ],
                  ),
                  LinkText(
                    onTap: () {},
                    label: "Ketentuan Layanan & Kebijakan Privasi",
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
