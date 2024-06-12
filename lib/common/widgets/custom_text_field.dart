// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/icons.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon_button.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool isPassword;
  final TextInputType textInputType;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: ColorName.text,
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            // labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgIconButton(
                      onClick: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      iconUrl: obscureText ? IconName.eye : IconName.eyeSlash,
                      height: 20,
                      color: Colors.black54,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
