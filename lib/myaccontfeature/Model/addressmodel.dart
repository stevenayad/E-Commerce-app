enum AddressType { home, work, other }

class Address {
  final String id;
  final String label;
  final String fullAddress;
  final String city;
  final String state;
  final String zipCode;
  final bool isDefault;
  final AddressType type;

  Address({
    required this.id,
    required this.label,
    required this.fullAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.isDefault,
    required this.type,
  });
}

class AddressRepository {
  List<Address> getAddresses() {
    return [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: '123 Main Street',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office',
        fullAddress: '324 Business Ave, Suite 200',
        city: 'New York',
        state: 'NY',
        zipCode: '10002',
        isDefault: false,
        type: AddressType.work,
      ),
    ];
  }

  Address? getDefaultAddress() {
    return getAddresses().firstWhere(
      (address) => address.isDefault,
      orElse:()=>getAddresses().first,
    );
  }
}
