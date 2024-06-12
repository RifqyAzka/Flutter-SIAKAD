import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/schedules_remote_data_source.dart';
import 'package:flutter_fic8_final_g3/data/models/response/schedules_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules_event.dart';
part 'schedules_state.dart';
part 'schedules_bloc.freezed.dart';

class SchedulesBloc extends Bloc<SchedulesEvent, SchedulesState> {
  final SchedulesRemoteDataSource dataSource;
  SchedulesBloc(this.dataSource) : super(const _Initial()) {
    on<_GetSchedules>(_getSchedules);
    on<_FilterScheduleByDay>(_filterScheduleByDay);
  }

  Future<void> _getSchedules(
    _GetSchedules event,
    Emitter<SchedulesState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getSchedules();
    result.fold(
      (error) => emit(_Error(message: error)),
      (schedule) => emit(_Loaded(schedule: schedule.data)),
    );
  }

  Future<void> _filterScheduleByDay(
    _FilterScheduleByDay event,
    Emitter<SchedulesState> emit,
  ) async {
    final List<Schedule> filteredSchedules = state.maybeWhen(
      loaded: (schedule) =>
          schedule.where((item) => item.hari == event.selectedDay).toList(),
      orElse: () => [],
    );
    emit(_Loaded(schedule: filteredSchedules));
  }
}
