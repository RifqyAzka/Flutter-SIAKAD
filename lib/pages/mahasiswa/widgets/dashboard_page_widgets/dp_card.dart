// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic8_final_g3/bloc/getUser/get_user_bloc.dart';

import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/common/widgets/profile_picture.dart';

class DpCard extends StatefulWidget {
  const DpCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DpCard> createState() => _DpCardState();
}

class _DpCardState extends State<DpCard> {
  @override
  void initState() {
    context.read<GetUserBloc>().add(const GetUserEvent.getProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (data) => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              gradient: const LinearGradient(
                colors: [
                  Color(0xff2E6394),
                  Color(0xff382F92),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: [
                const ProfilePicture(
                  imgUrl: Images.profile,
                  size: 70,
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      data.id.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Teknik Informatika",
                        style: TextStyle(
                          color: ColorName.text,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 19,
                        child: VerticalDivider(
                          color: ColorName.primary,
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        "Semester 7",
                        style: TextStyle(
                          color: ColorName.text,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          error: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: Text("User Not Found")),
        );
      },
    );
  }
}
