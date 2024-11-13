class Country {
  final String id;
  final String name;
  final String code;
  final String description;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
  });

  // Tạo đối tượng Country từ JSON
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
    );
  }

  // Chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
    };
  }
}
