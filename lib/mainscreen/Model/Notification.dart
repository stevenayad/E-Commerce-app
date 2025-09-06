enum Notificationtype { order, delivery, promo, payment }

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final Notificationtype type;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    required this.type,
  });
}



class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return  [
      NotificationItem(
        title: 'Order Confirmed',
        message: 'Your order #123456 has been confirmed and is being processed.',
        time: '2 minutes ago',
        type: Notificationtype.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer!',
        message: 'Get 20% off on all shoes this weekend!',
        time: '1 hour ago',
        type: Notificationtype.promo,
      ),
      NotificationItem(
        title: 'Out for Delivery',
        message: 'Your order #123443 is out for delivery.',
        time: '3 hours ago',
        type: Notificationtype.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment Successful',
        message: 'Payment for order #.',
        time: '2 minutes ago',
        type: Notificationtype.promo,
        isRead: true,
      ),
    ];
  }
}
