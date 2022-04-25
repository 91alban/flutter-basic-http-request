class User {
  final int id;
  final String name;
  final String email;
  final String userName;
  final String street;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.street,
  });

  static User fromJson(json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        userName: json['username'],
        street: json['address']['street'],
      );
}
