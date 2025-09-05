import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/controller/navagationcontroller.dart';
import 'package:flutter_application_1/mainscreen/presentation/ShoppingScreenview.dart';
import 'package:flutter_application_1/mainscreen/presentation/homescreenview.dart';
import 'package:flutter_application_1/mainscreen/presentation/widget/customBottomnavigationbar.dart';
import 'package:flutter_application_1/utilis/controller/themecontroller.dart';
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
                  //WishListScreenView(),
                  //AcounntScreenView(),
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
