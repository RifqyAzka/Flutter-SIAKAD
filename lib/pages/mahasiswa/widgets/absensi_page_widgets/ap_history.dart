import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/bloc/absensi_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/absensi_page_widgets/ap_history_item.dart';

class ApHistory extends StatefulWidget {
  const ApHistory({Key? key}) : super(key: key);

  @override
  State<ApHistory> createState() => _ApHistoryState();
}

class _ApHistoryState extends State<ApHistory> {
  @override
  void initState() {
    context.read<AbsensiBloc>().add(const AbsensiEvent.getAbsensi());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorName.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 3),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Riwayat Absensi",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Show All",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<AbsensiBloc, AbsensiState>(
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                    loaded: (absensi) {
                      if (absensi.isEmpty) {
                        return const Center(
                          child: Text(
                            "No Data Found",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: absensi.length,
                        itemBuilder: (context, index) {
                          final absen = absensi[index];
                          final day = absen.schedule.hari;
                          final jam = absen.schedule.jamMulai;

                          return ApHistoryItem(
                            ruangan: absen.schedule.ruangan,
                            matkul: absen.schedule.subject.title,
                            jam: absen.schedule.jamMulai,
                            waktu: "$day ~ $jam",
                          );
                        },
                      );
                    },
                    error: (message) => Center(child: Text(message)),
                    orElse: () => const Center(child: Text("Data Not Found")));
              },
            ),
          ),
        ],
      ),
    );
  }
}
