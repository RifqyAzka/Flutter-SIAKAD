import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/logout/logout_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/common/widgets/custom_button.dart';
import 'package:flutter_fic8_final_g3/common/widgets/pop_up_message.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_fic8_final_g3/pages/auth/pages/auth_page.dart';

class PpLogoutButton extends StatelessWidget {
  const PpLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onTap: () =>
                  context.read<LogoutBloc>().add(const LogoutEvent.logout()),
              backgroundColor: ColorName.primary,
              labelColor: Colors.white,
              label: "Logout",
            ),
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (success) async {
            //delete the token in device storage
            await AuthLocalDataSources().removeToken();

            //navigate to dashboard view
            Navigate.pushReplacement(const AuthPage());
          },
          error: (error) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: error,
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
