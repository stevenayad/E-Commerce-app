import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Themecontroller extends GetxController {
  final _box = GetStorage();
  final _key = 'isdarkMode';



  bool _loadTheme() => _box.read(_key) ?? false;
   //bool get isdarkMode => _loadTheme();
   ThemeMode get themeMode => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  void savetheme() {
    _box.write(_key, !_loadTheme());
  }

  void ToggleTheme() {
    Future.delayed(const Duration(microseconds: 50), () {
      Get.changeThemeMode(_loadTheme() ? ThemeMode.dark : ThemeMode.light);
      savetheme();
      update();
    });
  }
}
