import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/custom_navigation.dart';
import 'package:flutter_fic8_final_g3/common/widgets/siakad_provider.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_fic8_final_g3/pages/auth/pages/auth_page.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/pages/mahasiswa_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SiakadProvider(
      child: MaterialApp(
        title: 'SIAKAD UNCP',
        navigatorKey: Navigate.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorName.primary,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        // home: const AuthPage(),
        home: FutureBuilder(
          future: AuthLocalDataSources().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return const MahasiswaPage();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
