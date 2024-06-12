import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_image.dart';
import 'package:flutter_fic8_final_g3/pages/auth/pages/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigate.pushReplacement(const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgImage(
              iconUrl: Images.splash,
              height: 180,
            ),
            SizedBox(height: 15),
            Text(
              "SIAKAD UNCP",
              style: TextStyle(
                fontSize: 25.0,
                color: ColorName.text,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Sistem Akademik Universitas\nCokroaminoto Palopo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
            .animate()
            .fade()
            .slideY(
              begin: 1,
              duration: 1.5.seconds,
              curve: Curves.easeOutCubic,
            )
            .then()
            .shimmer(duration: 1.5.seconds),
      ),
    );
  }
}
