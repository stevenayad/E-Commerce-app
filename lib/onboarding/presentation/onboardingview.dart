import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/onboarding/presentation/widget/onboardingbody.dart';
import 'package:flutter_application_1/splah/controller/authcontroller.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Onboardingview extends StatelessWidget {
  const Onboardingview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: onboardingbody());
  }
}