enum Type { PARTICULAR, PROFESSIONAL }

class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  Type? type;
  DateTime? createdAt;

  User({this.id, this.name, this.email, this.phone, this.password, this.type = Type.PARTICULAR, this.createdAt});
}
