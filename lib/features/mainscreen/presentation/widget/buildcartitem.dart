import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_item_model.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/showdailogdelteitem.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildCartItem(
  BuildContext context, {
  required CartItemModel item,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
  required VoidCallback onRemove,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: isDark
              ? Colors.black.withOpacity(0.2)
              : Colors.grey.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
          ),
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 36,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.productName,
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyLarge,
                          Theme.of(context).textTheme.bodyLarge?.color ??
                              Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Showdailogdelteitem.showConfirmRemoveCartItem(
                          context,
                          item.productName,
                          onRemove,
                        );
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed:
                                item.quantity > 1 ? onDecrement : null,
                            icon: Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.red[400],
                            ),
                          ),
                          Text(
                            '${item.quantity}',
                            style: AppTextStyle.withColor(
                              AppTextStyle.bodyLarge,
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: onIncrement,
                            icon: Icon(
                              Icons.add,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
