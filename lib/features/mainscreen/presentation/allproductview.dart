import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/customappbar.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/customappbar2.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productgird.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Allproductview extends StatelessWidget {
  const Allproductview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar2(context, 'All Product'),
      //body: Productgird(isScroll: true),
    );
  }
}
