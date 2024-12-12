class User {
  final int id;
  final String? type;
  final String name;
  final String? cpf;
  final String? cnh;
  final String phone;
  final String email;
  final String? city;
  final String? state;
  final String? address;
  final String? cep;
  final int? number;
  final String? password;
  final String? avatar;

  User({
    required this.id,
    required this.type,
    required this.name,
    required this.cpf,
    this.cnh,
    required this.phone,
    required this.email,
    required this.city,
    required this.state,
    required this.address,
    required this.cep,
    required this.number,
    this.password,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      cpf: json['cpf'],
      cnh: json['cnh'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      address: json['address'],
      cep: json['cep'],
      number: json['number'],
      password: json['password'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'cpf': cpf,
      'cnh': cnh,
      'phone': phone,
      'email': email,
      'city': city,
      'state': state,
      'address': address,
      'cep': cep,
      'number': number,
      'password': password,
      'avatar': avatar,
    };
  }
}
