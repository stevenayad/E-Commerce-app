import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/categorycard.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get_connect/http/src/http/interface/request_base.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Helpcentersection extends StatelessWidget {
  const Helpcentersection({super.key});

  @override
  Widget build(BuildContext context) {
    final Category = [
      {'icon': Icons.shopping_bag_outlined, 'title': "Orders"},
      {'icon': Icons.payment_outlined, 'title': "Payment"},
      {'icon': Icons.shape_line_outlined, 'title': "Shipping"},
      {'icon': Icons.assignment_return_outlined, 'title': "Return"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            'Help Categories',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: Category.length,
          itemBuilder: (context, index) {
            return Categorycard(
              title: Category[index]["title"] as String,
              icon: Category[index]["icon"] as IconData,
            );
          },
        ),
      ],
    );
  }
}
