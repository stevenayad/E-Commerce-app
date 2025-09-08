import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment/presentation/widget/buildsummaryrow.dart';

class Ordersummarycard extends StatelessWidget {
  const Ordersummarycard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          buildSummaryRow(context, 'Subtoal', '\$599.93', false),
          buildSummaryRow(context, 'Shipping', '\$10', false),
          buildSummaryRow(context, 'tax', '\$53.0', false),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          buildSummaryRow(context, 'ToTal', '\$662.10', true),
        ],
      ),
    );
  }
}
