class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  // Converter objeto User para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  // Converter JSON para objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }
}
