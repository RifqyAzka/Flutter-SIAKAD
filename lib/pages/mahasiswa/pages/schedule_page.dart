import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/schedules/schedules_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/schedule_page_widget/sp_dropdown_schedule_widget.dart';

import '../../../common/constants/colors.dart';
import '../widgets/schedule_page_widget/sp_card_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  void initState() {
    context.read<SchedulesBloc>().add(const SchedulesEvent.getSchedules());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigate.pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: ColorName.primary,
        centerTitle: true,
        title: const Text(
          "Jadwal Kuliah",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<SchedulesBloc, SchedulesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(child: CircularProgressIndicator()),
            ),
            loaded: (schedule) {
              if (schedule.isEmpty) {
                return const Center(child: Text("No Data Found"));
              }
              return ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                children: [
                  // SpScheduleDropdown(onDaySelected: (selectedDay) {
                  //   context
                  //       .read<SchedulesBloc>()
                  //       .add(SchedulesEvent.filterScheduleByDay(selectedDay));
                  // }),
                  SpScheduleDropdown(onDaySelected: (string) {}),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: schedule.length,
                      itemBuilder: (context, index) {
                        final item = schedule[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: SpCardWidget(
                            matkul: item.subject.title,
                            dosen: item.subject.lecturer.name,
                            ruangan: item.ruangan,
                            jamMulai: item.jamMulai,
                            jamSelesai: item.jamSelesai,
                            onDetail: () {},
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: ColorName.greyBox),
                    ),
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
}
