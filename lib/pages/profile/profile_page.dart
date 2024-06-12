import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/getUser/get_user_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/icons.dart';
import 'package:flutter_fic8_final_g3/pages/profile/widgets/pp_card.dart';
import 'package:flutter_fic8_final_g3/pages/profile/widgets/pp_item.dart';
import 'package:flutter_fic8_final_g3/pages/profile/widgets/pp_logout_button.dart';
import 'package:flutter_fic8_final_g3/pages/profile/widgets/pp_top_part.dart';

class ProfilePage extends StatefulWidget {
  final String role;
  const ProfilePage({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    log("Get User Api..");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: ColorName.primary,
        centerTitle: true,
        title: const Text(
          "Profile ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            PpTopPart(),
            SizedBox(height: 30),
            PpCard(
              children: [
                PpItem(
                  iconUrl: IconName.editProfile,
                  label: 'Edit Profile',
                ),
                SizedBox(height: 10.0),
                PpItem(
                  iconUrl: IconName.notificationOutline,
                  label: 'Notifikasi',
                ),
                SizedBox(height: 10.0),
                PpItem(
                  iconUrl: IconName.language,
                  label: 'Bahasa',
                ),
              ],
            ),
            SizedBox(height: 25),
            // PpCard(
            //   children: [
            //     PpItem(
            //       iconUrl: IconName.security,
            //       label: 'Keamanan',
            //     ),
            //     SizedBox(height: 10.0),
            //     PpItem(
            //       iconUrl: IconName.theme,
            //       label: 'Tema',
            //     ),
            //   ],
            // ),
            // SizedBox(height: 20),
            PpLogoutButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
