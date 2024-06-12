// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/images.dart';
import '../../../../common/widgets/profile_picture.dart';

class MpHeaderMatkulWidget extends StatelessWidget {
  final String name;
  final String nim;
  const MpHeaderMatkulWidget({
    Key? key,
    required this.name,
    required this.nim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ProfilePicture(
            imgUrl: Images.profile2,
            size: 70,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          Text(
            nim,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
