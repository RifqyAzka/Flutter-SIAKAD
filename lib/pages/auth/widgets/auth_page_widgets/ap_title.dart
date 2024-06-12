import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/pages/auth/widgets/auth_page_widgets/ap_dash_line.dart';

class ApTitle extends StatelessWidget {
  const ApTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Silahkan Login",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.0),
        ApDashLine(width: 100)
      ],
    );
  }
}
