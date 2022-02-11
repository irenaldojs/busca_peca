import 'dart:convert';

class UserModel {
  String fistName;
  String lastName;
  String email;
  int phone;
  String password;
  UserModel({
    required this.fistName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });

  UserModel copyWith({
    String? fistName,
    String? lastName,
    String? email,
    int? phone,
    String? password,
  }) {
    return UserModel(
      fistName: fistName ?? this.fistName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fistName': fistName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fistName: map['fistName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(fistName: $fistName, lastName: $lastName, email: $email, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.fistName == fistName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phone == phone &&
      other.password == password;
  }

  @override
  int get hashCode {
    return fistName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      password.hashCode;
  }
}
