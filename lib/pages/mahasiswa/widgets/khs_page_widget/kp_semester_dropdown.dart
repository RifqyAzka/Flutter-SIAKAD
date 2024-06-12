import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/khs_page_widget/kp_semester_selection.dart';

import '../../../../common/constants/colors.dart';

class KpSemesterDropdown extends StatefulWidget {
  final String title;
  const KpSemesterDropdown({
    super.key,
    required this.title,
  });

  @override
  State<KpSemesterDropdown> createState() => _KpSemesterDropdownState();
}

class _KpSemesterDropdownState extends State<KpSemesterDropdown> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showSemester(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: ColorName.greyBox,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: ColorName.greyBoxBorder, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorName.textGrey,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: ColorName.textGrey),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  void _showSemester() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return KpSemesterSelection(key: widget.key);
      },
    );
  }
}
