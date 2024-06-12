part of 'schedules_bloc.dart';

@freezed
class SchedulesEvent with _$SchedulesEvent {
  const factory SchedulesEvent.started() = _Started;
  const factory SchedulesEvent.getSchedules() = _GetSchedules;
  const factory SchedulesEvent.filterScheduleByDay(String selectedDay) =
      _FilterScheduleByDay;
}
