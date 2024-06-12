import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class ApScanButton extends StatelessWidget {
  const ApScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
          ),
          child: const Text(
            "Scan QR Code",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Pastikan Permission kamera pada aplikasi Siakad sudah diallow ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
