// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';

class MpCardWidget extends StatelessWidget {
  final String intial;
  final String kodeMatkul;
  final String matkul;
  final String sks;
  final String nilai;
  const MpCardWidget({
    Key? key,
    required this.intial,
    required this.kodeMatkul,
    required this.matkul,
    required this.sks,
    required this.nilai,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                intial,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$kodeMatkul - $matkul',
                  style: const TextStyle(
                    color: ColorName.primary,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'SKS : ',
                    style: const TextStyle(
                      color: ColorName.textGrey,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "$sks ",
                        style: const TextStyle(
                          color: ColorName.primary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                        ),
                      ),
                      const TextSpan(
                        text: 'Nilai : ',
                        style: TextStyle(
                          color: ColorName.textGrey,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                        ),
                      ),
                      TextSpan(
                        text: '$nilai ',
                        style: const TextStyle(
                          color: ColorName.primary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
