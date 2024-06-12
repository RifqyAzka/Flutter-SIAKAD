import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/colors.dart';
import 'package:flutter_fic8_final_g3/common/constants/icons.dart';
import 'package:flutter_fic8_final_g3/common/widgets/svg_icon.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/pages/absensi_page.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/pages/dashboard_page.dart';
import 'package:flutter_fic8_final_g3/pages/profile/profile_page.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({Key? key}) : super(key: key);

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    DashboardPage(
      role: "Dosen",
    ),
    AbsensiPage(),
    ProfilePage(role: "Dosen"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: ColorName.primary,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: ColorName.primary,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.home,
                  height: 20,
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.scan,
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Absensi',
              ),
              BottomNavigationBarItem(
                icon: SvgIcon(
                  iconUrl: IconName.profile,
                  color: _selectedIndex == 2
                      ? Colors.white
                      : Colors.grey.withOpacity(0.8),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
