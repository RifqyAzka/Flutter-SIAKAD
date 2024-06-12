import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/widgets/custom_text_field.dart';
import 'package:flutter_fic8_final_g3/common/widgets/link_text.dart';
import 'package:flutter_fic8_final_g3/pages/auth/widgets/auth_page_widgets/ap_login_button.dart';

class ApInputField extends StatefulWidget {
  const ApInputField({Key? key}) : super(key: key);

  @override
  State<ApInputField> createState() => _ApInputFieldState();
}

class _ApInputFieldState extends State<ApInputField> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          label: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: passwordController,
          label: "Password",
          isPassword: true,
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: LinkText(
            onTap: () {},
            label: 'Lupa Password',
          ),
        ),
        const SizedBox(height: 30),
        ApLoginButton(
          emailController: emailController,
          passwordController: passwordController,
        ),
      ],
    );
  }
}
