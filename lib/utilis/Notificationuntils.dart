import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/mainscreen/Model/Notification.dart';

class Notificationuntils {
  static IconData getNoification(Notificationtype type) {
    switch (type) {
      case Notificationtype.order:
        return Icons.shopping_bag_outlined;
      case Notificationtype.delivery:
        return Icons.local_shipping_outlined;
      case Notificationtype.promo:
        return Icons.local_offer_outlined;
      case Notificationtype.payment:
        return Icons.payment_outlined;
    }
  }

    static Color getBackgroundIconData(BuildContext context, Notificationtype type) {
    switch (type) {
      case Notificationtype.order:
        return Theme.of(context).primaryColor;
      case Notificationtype.delivery:
        return Colors.green[100]!;
      case Notificationtype.promo:
        return Colors.orange[100]!;
      case Notificationtype.payment:
        return  Colors.red[100]!;
    }
  }

  static Color getColorIconData(BuildContext context, Notificationtype type) {
    switch (type) {
      case Notificationtype.order:
        return Theme.of(context).primaryColor;
      case Notificationtype.delivery:
        return Colors.green;
      case Notificationtype.promo:
        return Colors.orange;
      case Notificationtype.payment:
        return  Colors.red;
    }
  }
}
