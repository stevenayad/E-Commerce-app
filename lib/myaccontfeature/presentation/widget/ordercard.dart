import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/Model/ordermodel.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:get/get.dart';

class Ordercard extends StatelessWidget {
  const Ordercard({
    super.key,
    required this.ordermodel,
    required this.onviewdetils,
  });
  final Ordermodel ordermodel;
  final VoidCallback onviewdetils;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(ordermodel.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ${ordermodel.orderNumber}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${ordermodel.itemCount} items . \$${ordermodel.totalAmount}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyMedium,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      const SizedBox(height: 8),
                      buildstachchip(context, ordermodel.status),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          InkWell(
            onTap: onviewdetils,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Text(
                  'View Details',
                  style: AppTextStyle.withColor(
                    AppTextStyle.buttonMedium,
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildstachchip(BuildContext context, OrderStatus status) {
  Color getstatuscolor() {
    switch (status) {
      case OrderStatus.active:
        return Colors.blue;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getStatusText() {
    switch (status) {
      case OrderStatus.active:
        return 'Active';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: getstatuscolor().withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      getStatusText(),
      style: AppTextStyle.withColor(AppTextStyle.bodySmall, getstatuscolor()),
    ),
  );
}

 

