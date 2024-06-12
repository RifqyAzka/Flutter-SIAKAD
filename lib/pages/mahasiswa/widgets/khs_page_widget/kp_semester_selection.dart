import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/khs_page_widget/kp_semester_button.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/khs_page_widget/kp_semester_item.dart';

class KpSemesterSelection extends StatefulWidget {
  const KpSemesterSelection({
    super.key,
  });

  @override
  State<KpSemesterSelection> createState() => _KpSemesterSelectionState();
}

class _KpSemesterSelectionState extends State<KpSemesterSelection> {
  int selectedSemester = -1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      actionsPadding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 17,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return KpSemesterItem(
              onTap: () => setState(() => selectedSemester = index),
              isSelected: index == selectedSemester,
              label: "Semester ${index + 1}",
            );
          },
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            KpSemesterButton(
              onTap: () => Navigate.pop(),
              isOutline: true,
              label: "Batal",
            ),
            const SizedBox(width: 10),
            KpSemesterButton(
              onTap: () => Navigate.pop(),
              label: "Pilih",
            ),
          ],
        ),
      ],
    );
  }
}
