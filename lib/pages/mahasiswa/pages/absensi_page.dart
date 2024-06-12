import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_image.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/absensi_page_widgets/ap_history.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/absensi_page_widgets/ap_map.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/absensi_page_widgets/ap_scan_button.dart';

class AbsensiPage extends StatelessWidget {
  const AbsensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.primary,
        centerTitle: true,
        title: const Text(
          "Absensi Kuliah",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 25,
          // vertical: 10,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            SvgImage(
              iconUrl: Images.absensi,
              height: 200,
            ),
            ApScanButton(),
            SizedBox(height: 20),
            ApMap(),
            SizedBox(height: 20),
            ApHistory(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
