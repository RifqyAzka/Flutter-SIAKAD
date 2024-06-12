// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ApHistoryItem extends StatelessWidget {
  final String ruangan;
  final String matkul;
  final String jam;
  final String waktu;
  const ApHistoryItem({
    Key? key,
    required this.ruangan,
    required this.matkul,
    required this.jam,
    required this.waktu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "$ruangan - $matkul",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  waktu,
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(width: 10),
          // Text(
          //   jam,
          //   style: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 13,
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}
