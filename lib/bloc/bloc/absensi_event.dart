part of 'absensi_bloc.dart';

@freezed
class AbsensiEvent with _$AbsensiEvent {
  const factory AbsensiEvent.started() = _Started;
  const factory AbsensiEvent.getAbsensi() = _GetAbsensi;
}
