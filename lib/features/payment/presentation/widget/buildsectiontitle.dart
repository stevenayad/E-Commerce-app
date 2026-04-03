import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Buildsectiontitle extends StatelessWidget {
  const Buildsectiontitle({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        titel,
        style: AppTextStyle.withColor(
          AppTextStyle.h3,
          Theme.of(context).textTheme.bodyLarge!.color!,
        ),
      ),
    );
  }
}
