import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/catergroychips.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/customappbar2.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/productgird.dart';

class Shoppingscreenview extends StatelessWidget {
  const Shoppingscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(context, 'Shopping'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 16), child: Catergroychips()),
            Productgird(isScroll: false,),
          ],
        ),
      ),
    );
  }
}
