import 'package:get/get.dart';

class SlideController extends GetxController {
  var selectedIndex = (-1).obs;

  void changeIndex(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }
}
