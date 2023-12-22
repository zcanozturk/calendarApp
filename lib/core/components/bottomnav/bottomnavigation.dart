import 'package:flutter/material.dart';
import 'package:flutter_template_simple/view/home/view/home_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bottomnav_view_model/bottomnavigation_view_model.dart';

BottomNavigationBar getBottomNavigation() {
  final ctrl = Get.put(BottomNavigationBarViewModel());
  return BottomNavigationBar(
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    currentIndex: ctrl.bottomBarIndex.value,
    onTap: (value) {
      ctrl.changeTabIndex(value);
      onTap(
        value,
      );
      print(ctrl.bottomBarIndex.value);
    },
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          height: Get.height * 0.03,
          width: Get.width * 0.2,
          child: Icon(Icons.home_outlined),
          // child: Image.asset(
          //   'assets/images/alt-menu-3.png',
          //   fit: BoxFit.fitWidth,
          // ),
        ),
        label: 'İşler',
        //backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: Get.width * 0.2,
          height: Get.height * 0.03,
          child: Icon(Icons.star_outline),
        ),
        label: 'Done',
        // backgroundColor: Colors.blue,
      ),
    ],
  );
}

onTap(int tabIndex) {
  switch (tabIndex) {
    case 0:
      Get.off(() => HomeView());

      break;
    case 1:
    
      break;

    default:
      Get.off(() => HomeView());
      break;
  }
}
