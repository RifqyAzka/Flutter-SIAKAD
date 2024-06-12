// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';

class SpCardWidget extends StatelessWidget {
  final String matkul;
  final String dosen;
  final String ruangan;
  final String jamMulai;
  final String jamSelesai;
  final VoidCallback onDetail;
  const SpCardWidget({
    Key? key,
    required this.matkul,
    required this.dosen,
    required this.ruangan,
    required this.jamMulai,
    required this.jamSelesai,
    required this.onDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.greyBox),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            matkul,
            style: const TextStyle(
              color: ColorName.primary,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          Text(
            dosen,
            style: const TextStyle(
              color: ColorName.textGrey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Text(
            'Ruangan: $ruangan',
            style: const TextStyle(
              color: ColorName.textGrey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _hourIndicator(
                      title: 'Jam Mulai',
                      hour: jamMulai,
                    ),
                    const Spacer(),
                    _hourIndicator(
                      title: 'Jam Selesai',
                      hour: jamSelesai,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onDetail,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      color: ColorName.primary,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: ColorName.primary)),
                  child: const Center(
                    child: Text(
                      'Detail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _hourIndicator({
    required String title,
    required String hour,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: ColorName.textGrey,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        Text(
          hour,
          style: const TextStyle(
            color: ColorName.primary,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
