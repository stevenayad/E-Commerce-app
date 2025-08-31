import 'package:flutter/material.dart';
import 'package:flutter_application_1/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/custom_textfelid.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/sigininbody.dart';
import 'package:flutter_application_1/Authcation/presenation/widget/signupview.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: signupbody());
  }
}
