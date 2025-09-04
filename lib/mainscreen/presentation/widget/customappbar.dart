

import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainscreen/Model/product.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:share_plus/share_plus.dart';

PreferredSizeWidget customAppBar(BuildContext context, Product product) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
    ),
    title: Text(
      "Product Details",
      style: AppTextStyle.withColor(
        AppTextStyle.h3,
        isDark ? Colors.white : Colors.black,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          _shareProduct(context, product.name, product.description);
        },
        icon: Icon(Icons.search),
      ),
    ],
  );
}

Future<void> _shareProduct(
  BuildContext context,
  String productName,
  String description,
) async {
  final box =
      context.findRenderObject()
          as RenderBox?; //for ipad , web , Know Size , Postion of Widget
  const String shopLink = 'https://yourshop.com/product/congress';
  final String shareMessage = '$description\n\nShop now at: $shopLink';

  try {
    final ShareResult result = await Share.share(
      shareMessage,
      subject: productName,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );

    if (result.status == ShareResultStatus.success) {
      debugPrint('Thank you for sharing!');
    }
  } catch (e) {
    debugPrint('Error Sharing: $e');
  }
}
