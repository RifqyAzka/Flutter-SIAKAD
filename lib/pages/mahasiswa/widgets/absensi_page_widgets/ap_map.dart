import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';

class ApMap extends StatelessWidget {
  const ApMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 169,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: const DecorationImage(
          image: AssetImage(Images.map),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
    );
  }
}
