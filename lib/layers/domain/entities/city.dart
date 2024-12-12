class City {
  final String name;
  final String state;

  City({required this.name, required this.state});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      state: json['abbreviation'],
    );
  }
}
