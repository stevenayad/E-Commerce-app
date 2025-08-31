import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/splah/presentation/splahview.dart';
import 'package:flutter_application_1/utilis/apptheme.dart';
import 'package:flutter_application_1/utilis/controller/themecontroller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/splah/controller/authcontroller.dart';

void main() {
  
  if (kIsWeb) {
    _setupWebDebugFilter();
  }

  WidgetsFlutterBinding.ensureInitialized();

  Get.put(Themecontroller(), permanent: true);
  Get.put(Authcontroller(), permanent: true);

  runApp(const MyApp());
}

void _setupWebDebugFilter() {
  final originalDebugPrint = debugPrint;
  debugPrint = (String? message, {int? wrapWidth}) {
    if (message != null &&
        !message.contains('DebugService') &&
        !message.contains('Cannot send Null') &&
        !message.contains('WipError')) {
      originalDebugPrint(message, wrapWidth: wrapWidth);
    }
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themecontroller = Get.find<Themecontroller>();
    return GetMaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themecontroller.themeMode,
      home: Splahscreenview(),
    );
  }
}
