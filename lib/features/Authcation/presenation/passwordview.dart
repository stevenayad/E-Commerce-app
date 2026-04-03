import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Authcation/presenation/views/widget/passwordbody.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Passwordview extends StatelessWidget {
  const Passwordview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: passwordbody());
  }
}
