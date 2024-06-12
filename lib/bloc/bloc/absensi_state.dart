part of 'absensi_bloc.dart';

@freezed
class AbsensiState with _$AbsensiState {
  const factory AbsensiState.initial() = _Initial;
  const factory AbsensiState.loading() = _Loading;
  const factory AbsensiState.loaded({
    required List<Absen> absensi,
  }) = _Loaded;
  const factory AbsensiState.error({
    required String message,
  }) = _Error;
}
