import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/Model/addressmodel.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/buildtextfeild.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';

Future showbottomshett(
  BuildContext context, {
  Address? address,
  required String text,
  required String textbutton,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppTextStyle.withColor(
                  AppTextStyle.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// Fields
          buildTextField(
            context,
            'Label (e.g Home ,Office)',
            Icons.label_outline,
            address?.label ?? "",
          ),
          const SizedBox(height: 16),
          buildTextField(
            context,
            'Full Address',
            Icons.location_on_outlined,
            address?.fullAddress ?? "",
          ),
          const SizedBox(height: 16),
          buildTextField(
            context,
            'City',
            Icons.location_city_outlined,
            address?.city ?? "",
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: buildTextField(
                  context,
                  'State',
                  Icons.map_outlined,
                  address?.state ?? "",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildTextField(
                  context,
                  'Zip Code',
                  Icons.pin_outlined,
                  address?.zipCode ?? "",
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          /// Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: handle save/update
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                textbutton,
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMedium,
                  Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}
