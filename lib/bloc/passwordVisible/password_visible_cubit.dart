import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibleCubit extends Cubit<bool> {
  PasswordVisibleCubit() : super(false);

  void tooglePasswordVisible() {
    emit(!state);
  }
}
