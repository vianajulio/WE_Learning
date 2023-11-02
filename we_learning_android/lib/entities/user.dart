class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? userType;
  String? registerDate;
  String? pierSitReg;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.registerDate,
    this.pierSitReg,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = (json['id']);
    name = json['name'];
    email = json['email'];
    password = json['password'];
    userType = json['userType'];
    registerDate = json['registerDate'];
    pierSitReg = json['pierSitReg'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'usertype': userType,
      'registerDate': registerDate,
      'pierSitReg': pierSitReg,
    };
  }
}
