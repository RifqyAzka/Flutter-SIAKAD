// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/getUser/get_user_bloc.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/profile_picture.dart';

class PpTopPart extends StatelessWidget {
  const PpTopPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (data) {
            return Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                const ProfilePicture(
                  imgUrl: Images.profile,
                  size: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    color: ColorName.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.email,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    data.roles,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text("User Not Found")),
        );
      },
    );
  }
}
