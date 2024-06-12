import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/khs/khs_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/data/models/response/khs_response_model.dart';

import '../../../common/constants/colors.dart';
import '../widgets/khs_page_widget/kp_semester_dropdown.dart';
import '../widgets/khs_page_widget/kp_footer_widget.dart';
import '../widgets/khs_page_widget/kp_header_widget.dart';
import '../widgets/khs_page_widget/kp_table_row_widget.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  void initState() {
    context.read<KhsBloc>().add(const KhsEvent.getKhs());
    super.initState();
  }

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
          "Kartu Hasil Studi",
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
              child: Center(child: CircularProgressIndicator()),
            ),
            loaded: (data) {
              if (data.isEmpty) {
                return const Center(child: Text("No Data Found"));
              }

              final totalSks = calculateTotalSks(data);
              final ipk = calculateIpk(data);
              return ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  KpHeaderWidget(
                    name: data.isNotEmpty ? data.first.student.name : "",
                    nim: data.isNotEmpty ? data.first.studentId.toString() : "",
                    angkatan: data.isNotEmpty ? data.first.tahunAkademik : "",
                    totalSks: totalSks.toString(),
                    ipk: ipk.toStringAsFixed(2),
                    jumlahMatkul: data.isNotEmpty ? data.length.toString() : "",
                  ),
                  const SizedBox(height: 40),
                  const KpSemesterDropdown(title: 'Semester 5'),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorName.greyBox,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: ColorName.greyBoxBorder,
                        width: 1,
                      ),
                    ),
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(4),
                      },
                      children: [
                        const TableRow(
                          children: [
                            KpTableRowWidget(
                              title: "Kode",
                              fontWeight: FontWeight.w700,
                            ),
                            KpTableRowWidget(
                              title: "Mata Kuliah",
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        for (var rowData in data)
                          TableRow(
                            children: [
                              KpTableRowWidget(
                                title: rowData.subjectId.toString(),
                              ),
                              KpTableRowWidget(
                                title: rowData.subject.title,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  KpFooterWidget(
                    totalSks: totalSks.toString(),
                    jumlahMatkul: data.length.toString(),
                  ),
                ],
              );
            },
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text("User Not Found")),
          );
        },
      ),
    );
  }

  int calculateTotalSks(List<Khs> data) {
    int totalSks = 0;
    for (var item in data) {
      totalSks += item.subject.sks;
    }
    return totalSks;
  }

  double calculateIpk(List<Khs> data) {
    int ipk = 0;
    for (var item in data) {
      ipk += int.parse(item.nilai);
    }
    return ipk / data.length;
  }
}
