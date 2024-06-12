// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/khs_page_widget/kp_semester_button.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/schedule_page_widget/sp_day.dart';

class SpDaySelection extends StatefulWidget {
  final Function(String) onDaySelected;
  final String selectedDay;
  const SpDaySelection({
    Key? key,
    required this.onDaySelected,
    required this.selectedDay,
  }) : super(key: key);

  @override
  State<SpDaySelection> createState() => _SpDaySelectionState();
}

class _SpDaySelectionState extends State<SpDaySelection> {
  int selectedSemester = -1;

  final List<String> days = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
  ];
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
          itemCount: days.length,
          itemBuilder: (context, index) {
            final day = days[index];
            return SpDay(
              onTap: () => setState(() => selectedSemester = index),
              isSelected: index == selectedSemester,
              label: day,
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
              onTap: () {
                widget.onDaySelected(widget.selectedDay);
                Navigate.pop();
              },
              label: "Pilih",
            ),
          ],
        ),
      ],
    );
  }
}
