import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/absensi_remote_data_source.dart';
import 'package:flutter_fic8_final_g3/data/models/response/absensi_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'absensi_event.dart';
part 'absensi_state.dart';
part 'absensi_bloc.freezed.dart';

class AbsensiBloc extends Bloc<AbsensiEvent, AbsensiState> {
  final AbsensiRemoteDataSource dataSource;
  AbsensiBloc(this.dataSource) : super(const _Initial()) {
    on<_GetAbsensi>(_getAbsensi);
  }

  Future<void> _getAbsensi(
    _GetAbsensi event,
    Emitter<AbsensiState> emit,
  ) async {
    emit(const _Loading());
    final result = await dataSource.getAbsensi();
    result.fold(
      (error) => emit(_Error(message: error)),
      (absensi) => emit(_Loaded(absensi: absensi.data)),
    );
  }
}
