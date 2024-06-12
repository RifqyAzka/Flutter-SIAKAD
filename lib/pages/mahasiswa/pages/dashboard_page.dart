// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/dashboard_page_widgets/dp_app_bar.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/dashboard_page_widgets/dp_card.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/dashboard_page_widgets/dp_list_menu.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/dashboard_page_widgets/dp_list_title.dart';

class DashboardPage extends StatelessWidget {
  final String role;
  const DashboardPage({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgIcon(
              iconUrl: Images.curvedLine,
              color: Colors.grey.withOpacity(0.15),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: SafeArea(
              minimum: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  const DpAppBar(),
                  const SizedBox(height: 20),
                  const DpCard(),
                  const SizedBox(height: 20),
                  DpListTitle(
                    role: role,
                  ),
                  const SizedBox(height: 10),
                  const DpListMenu(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
