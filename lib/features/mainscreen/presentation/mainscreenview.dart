import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/mainscreen/controller/navagationcontroller.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product%20repository/product_repo_implemtation.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/ShoppingScreenview.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/acounntscreenview.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cubit/product_cubit_cubit.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/homescreenview.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/customBottomnavigationbar.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/wishlistscreenview.dart';
import 'package:flutter_application_1/utilis/controller/themecontroller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Mainscreenview extends StatelessWidget {
  const Mainscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    final Navagationcontroller navagationcontroller = Get.put(
      Navagationcontroller(),
    );
    return GetBuilder<Themecontroller>(
      builder: (themecontroller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: AnimatedSwitcher(
            duration: Duration(microseconds: 200),
            child: Obx(
              () => IndexedStack(
                index: navagationcontroller.currentindex.value,
                children: [
                  Homescreenview(),
                  Shoppingscreenview(),
                  Wishlistscreenview(),
                  Acounntscreenview(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Custombottomnavigationbar(),
        );
      },
    );
  }
}
