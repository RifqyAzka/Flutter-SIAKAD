import 'package:flutter/material.dart';
import 'package:flutter_fic8_final_g3/common/constants/images.dart';
import 'package:flutter_fic8_final_g3/pages/mahasiswa/widgets/dashboard_page_widgets/dp_menu.dart';

import '../../../../common/constants/custom_navigation.dart';
import '../../pages/khs_page.dart';
import '../../pages/matkul_page.dart';
import '../../pages/schedule_page.dart';

class DpListMenu extends StatelessWidget {
  const DpListMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<DpMenu> dummyData = [
      DpMenu(imgUrl: Images.khs, label: "Kartu Hasil Studi"),
      DpMenu(imgUrl: Images.jk, label: "Jadwal Kuliah"),
      DpMenu(imgUrl: Images.nm, label: "Nilai Matkul"),
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          final item = dummyData[index];
          return InkWell(
            onTap: (){
              if (index == 0) {
                Navigate.push(const KhsPage());
              }else if (index == 1){
                Navigate.push(const SchedulePage());
              }else if (index == 2){
                Navigate.push(const MatkulPage());
              }
            },
            child: DpMenu(
              imgUrl: item.imgUrl,
              label: item.label,
            ),
          );
        },
      ),
    );
  }
}
