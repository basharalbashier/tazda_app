class User {
  User({
    this.id,
     this.email,
    required this.username,
    required this.password,
     this.name,
     this.address,
     this.phone,
   required this.token,
  });

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      token: json['token'],
    );
  }


  int? id;

  String? email;

  String username;

  String password;

  Map<String, dynamic>? name;

  Map<String, dynamic>? address;

  String? phone;

  String token;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name,
      'address': address,
      'phone': phone,
      'token': token,
    };
  }
}
