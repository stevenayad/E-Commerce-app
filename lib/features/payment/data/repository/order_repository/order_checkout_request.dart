class OrderCheckoutRequest {
  const OrderCheckoutRequest({
    required this.city,
    required this.zipCode,
    required this.street,
    required this.phoneNo,
    required this.country,
    this.state = '',
  });

  final String city;
  final String zipCode;
  final String street;
  final String phoneNo;
  final String country;
  final String state;

  Map<String, dynamic> toJson() => {
        'city': city,
        'zip_code': zipCode,
        'street': street,
        'phone_no': phoneNo,
        'country': country,
        'state': state,
      };
}
