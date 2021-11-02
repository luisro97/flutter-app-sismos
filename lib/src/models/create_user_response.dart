import 'dart:convert';


UsersResponse userResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));
String userModelToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    required this.message,
    required this.auth,
    required this.token,
  });

  String message;
  bool auth;
  String token;

  factory UsersResponse.fromRawJson(String str) => UsersResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
    message: json["message"],
    auth: json["auth"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "auth": auth,
    "token": token,
  };
}
