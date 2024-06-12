import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/khs/khs_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/khs_page_widget/kp_semester_dropdown.dart';

import '../../../common/constants/colors.dart';
import '../widgets/matkul_page_widget/mp_card_widget.dart';
import '../widgets/matkul_page_widget/mp_header_widget.dart';

class MatkulPage extends StatelessWidget {
  const MatkulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigate.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorName.primary,
        centerTitle: true,
        title: const Text(
          "Nilai Matkul",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<KhsBloc, KhsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (khs) {
              if (khs.isEmpty) {
                return const Center(child: Text("No Data Found"));
              }
              return SafeArea(
                minimum: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: ListView(
                  children: [
                    MpHeaderMatkulWidget(
                      name: khs.first.student.name,
                      nim: khs.first.studentId.toString(),
                    ),
                    const SizedBox(height: 16),
                    const KpSemesterDropdown(title: 'Semester 5'),
                    const SizedBox(height: 16),
                    Container(
                      // height: MediaQuery.of(context).size.height / 1.7,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorName.greyBox),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: khs.length,
                        itemBuilder: (context, index) {
                          final item = khs[index];
                          return MpCardWidget(
                            intial: "P",
                            kodeMatkul: item.subjectId.toString(),
                            matkul: item.subject.title,
                            sks: item.subject.sks.toString(),
                            nilai: item.grade,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(color: ColorName.greyBox),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text("User Not Found")),
          );
        },
      ),
    );
  }
}
