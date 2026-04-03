import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/Model/product.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/buildsummarysection.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/buildwishlistitem.dart'
    show buildwishlistitem;
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Wishlistscreenview extends StatelessWidget {
  const Wishlistscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'MY list',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildsummaryselection(context)),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return buildwishlistitem(
                    context,
                    (products.where(
                      (product) => product.isfavourite,
                    )).toList()[index],
                  );
                },
                childCount:
                    products.where((product) => product.isfavourite).length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
