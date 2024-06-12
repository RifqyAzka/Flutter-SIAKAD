// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/icons.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon.dart';

import '../../../../common/constants/colors.dart';

class KpHeaderWidget extends StatelessWidget {
  final String name;
  final String nim;
  final String angkatan;
  final String totalSks;
  final String ipk;
  final String jumlahMatkul;
  const KpHeaderWidget({
    Key? key,
    required this.name,
    required this.nim,
    required this.angkatan,
    required this.totalSks,
    required this.ipk,
    required this.jumlahMatkul,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorName.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nama : $name',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          Text(
            'NIM : $nim',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          Text(
            'Angkatan : $angkatan',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _rowIcon(
                iconUrl: IconName.chart,
                content: "$totalSks SKS",
              ),
              _rowIcon(
                iconUrl: IconName.chart,
                content: "$jumlahMatkul Matkul",
              ),
              _rowIcon(
                iconUrl: IconName.chart,
                content: "IPK $ipk",
              ),
            ],
          )
        ],
      ),
    );
  }

  _rowIcon({
    required String iconUrl,
    required String content,
  }) {
    return Row(
      children: [
        SvgIcon(
          iconUrl: iconUrl,
          color: Colors.white,
          height: 18,
        ),
        const SizedBox(width: 3),
        Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
