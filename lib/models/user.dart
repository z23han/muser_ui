class User {
  // String username;
  // String avatar;
  String name;
  String phone;
  String gender;
  String city;
  String password;
  String age;
  bool isConsented;

  // User({this.username, this.avatar});
  User(this.name, this.password, this.gender, this.age, this.phone, this.city, this.isConsented);
  
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        gender = json['gender'],
        city = json['city'],
        age = json['age'],
        phone = json['phone'],
        isConsented = json['isConsented'];
  
  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'password': password,
    'gender': gender,
    'city': city,
    'age': age,
    'isConsented': isConsented,
    'phone': phone
  };
}
