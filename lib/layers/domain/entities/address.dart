class Address {
  final int id;
  final String zipcode;
  final String city;
  final String state;
  final String district;
  final String address;
  final int number;
  final String? complement;

  Address({
    required this.id,
    required this.zipcode,
    required this.city,
    required this.state,
    required this.district,
    required this.address,
    required this.number,
    this.complement,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      zipcode: json['zipcode'],
      city: json['city'],
      state: json['state'],
      district: json['district'],
      address: json['address'],
      number: json['number'],
      complement: json['complement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zipcode': zipcode,
      'city': city,
      'state': state,
      'district': district,
      'address': address,
      'number': number,
      'complement': complement,
    };
  }
}
