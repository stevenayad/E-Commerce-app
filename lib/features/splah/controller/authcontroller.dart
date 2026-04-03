import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Authcontroller extends GetxController {
  final _storage = GetStorage();

  final RxBool isFirsttime = true.obs;
  final RxBool ISloogged = false.obs;

  bool get isfirsttime => isFirsttime.value;
  bool get isLogged => ISloogged.value;

  void onInit() {
    super.onInit();
    _loadintialstate();
  }

  void _loadintialstate() {
    isFirsttime.value = _storage.read('isfirsttime') ?? false;
    ISloogged.value = _storage.read('islogged') ?? false;
  }

  void setfirsttimeDone() {
    isFirsttime.value = false;
    _storage.write('isfirsttime', false);
  }

  void loginin() {
    ISloogged.value = true;
     _storage.write('islogged', true);
  }

  
  void loginout() {
    ISloogged.value = false;
     _storage.write('islogged', false);
  }
}
