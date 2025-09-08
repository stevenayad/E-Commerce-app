import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

class Checkoutbottombar extends StatelessWidget {
  const Checkoutbottombar({
    super.key,
    required this.totalamount,
    required this.onplaceorder,
  });
  final double totalamount;
  final VoidCallback onplaceorder;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onplaceorder,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Place Order (\$${totalamount.toStringAsFixed(2)})',
          style: AppTextStyle.withColor(
            AppTextStyle.buttonMedium,
            Colors.white,
          ),
        ),
      ),
    );
  }
}
