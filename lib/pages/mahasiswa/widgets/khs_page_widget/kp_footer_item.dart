// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';

class KpFooterItem extends StatelessWidget {
  final String title;
  final String value;
  const KpFooterItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                color: ColorName.secondaryTextGrey,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: ColorName.secondaryTextGrey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorName.secondaryTextGrey,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
