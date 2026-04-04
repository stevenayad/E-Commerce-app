import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class ProductBottomBar extends StatelessWidget {


  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: mediaQuery.height * 0.02,
                  ),
                  side: BorderSide(
                    color: isDark ? Colors.white70 : Colors.black12,
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: AppTextStyle.withColor(
                    AppTextStyle.buttonMedium,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
              ),
            ),

            SizedBox(width: mediaQuery.width * 0.2),

            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: mediaQuery.height * 0.02,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Buy Now',
                  style: AppTextStyle.withColor(
                    AppTextStyle.buttonMedium,
                    Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
