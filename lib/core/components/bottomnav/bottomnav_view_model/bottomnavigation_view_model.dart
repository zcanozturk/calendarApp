import 'package:get/get.dart';

class BottomNavigationBarViewModel extends GetxController {
  BottomNavigationBarViewModel();

  var bottomBarIndex = 0.obs;
  void changeTabIndex(var index) {
    bottomBarIndex.value = index;
    update();
  }
}
