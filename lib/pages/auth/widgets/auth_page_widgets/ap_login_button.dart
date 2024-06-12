// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/login/login_bloc.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/common/widgets/custom_button.dart';
import 'package:flutter_fic8_final_g3/common/widgets/pop_up_message.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_fic8_final_g3/data/models/request/auth_request_model.dart';
import 'package:flutter_fic8_final_g3/pages/dosen/pages/dosen_page.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/pages/mahasiswa_page.dart';

class ApLoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ApLoginButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => CustomButton(
            onTap: () {
              //get the email & password
              final loginModel = AuthRequestModel(
                email: emailController.text,
                password: passwordController.text,
              );

              context
                  .read<LoginBloc>()
                  .add(LoginEvent.login(requestModel: loginModel));
            },
            backgroundColor: ColorName.primary,
            label: 'Login',
            labelColor: Colors.white,
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data) async {
            //save user token to local
            AuthLocalDataSources().saveAuthData(data);

            //display login success message
            final roles = data.user.roles;

            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: roles == 'mahasiswa'
                    ? 'Login Berhasil Sebagai Mahasiswa'
                    : 'Login Berhasil Sebagai Dosen',
                backgroundColor: Colors.greenAccent,
              ),
            );

            //navigate to dashboard view
            if (roles == 'mahasiswa') {
              Navigate.pushReplacement(const MahasiswaPage());
            } else {
              Navigate.pushReplacement(const DosenPage());
            }
          },
          error: (message) async {
            //display error message
            //display login success message
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: message,
                backgroundColor: Colors.redAccent,
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}
