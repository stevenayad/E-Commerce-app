import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/onboarding/presentation/onboardingview.dart';
import 'package:flutter_application_1/splah/controller/authcontroller.dart';
import 'package:flutter_application_1/splah/presentation/widget/splahviewbody.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';

class Splahscreenview extends StatelessWidget {
  Splahscreenview({super.key});

    final Authcontroller authcontroller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
 
      Future.delayed(const Duration(seconds: 2), () {
      /*  if (authcontroller.isfirsttime) {
         Get.off(()=>Onboardingview());
      }else if(authcontroller.isLogged){
       //MainScreen
      }else{
         Get.off(() => Signinview());
      }*/
        Get.off(()=>Onboardingview());
      });
    
    return Scaffold(body: Splahviewbody());
  }
}
