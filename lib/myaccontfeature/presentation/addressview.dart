import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/Model/addressmodel.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/buildadreescard.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/widgeteditasressbottomshet.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressRepository addressRepository = AddressRepository();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order Screen',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showbottomshett(
                context,
                text: 'Add New Address',
                textbutton: 'Save Address',
              );
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: addressRepository.getAddresses().length,
        itemBuilder: (context, index) {
          return buildAdress(context, index, addressRepository);
        },
      ),
    );
  }
}
