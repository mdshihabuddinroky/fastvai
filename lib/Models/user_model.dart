import 'dart:convert';

List<Users> userFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String userToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
  });

  int id;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
