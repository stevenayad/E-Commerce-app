import 'package:get/get.dart';

class Navagationcontroller extends GetxController {
  RxInt currentindex = 0.obs;
  void changeindex(int index) {
    currentindex.value = index;
    update();
  }
}
