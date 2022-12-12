class UserModel {
  String? name;
  String? email;
  int? age;
  String? gender;
  double? weight;
  int? phoneNumber;
  String? address;
  List<String>? diseases;
  
  UserModel({
    this.name,
    this.email,
    this.age,
    this.gender,
    this.weight,
    this.phoneNumber,
    this.address,
    this.diseases,
  });

  UserModel copyWith({
    String? name,
    String? email,
    int? age,
    String? gender,
    double? weight,
    int? phoneNumber,
    String? address,
    List<String>? diseases,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      diseases: diseases ?? this.diseases,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'weight': weight,
      'phoneNumber': phoneNumber,
      'address': address,
      'diseases': diseases,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] != null ? json['name'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      age: json['age'] != null ? json['age'] as int : null,
      gender: json['gender'] != null ? json['gender'] as String : null,
      weight: json['weight'] != null ? json['weight'] as double : null,
      phoneNumber:
          json['phoneNumber'] != null ? json['phoneNumber'] as int : null,
      address: json['address'] != null ? json['address'] as String : null,
      diseases: json['diseases'] != null
          ? List<String>.from((json['diseases'] as List<String>))
          : null,
    );
  }
}
