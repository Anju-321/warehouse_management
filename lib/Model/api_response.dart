import 'dart:convert';

class Apiresponse<T> {
  bool status;
  String message;
  T data;
  T? token;

  Apiresponse(
      {required this.data, required this.message, required this.status,this.token});

  factory Apiresponse.fromJson(int status, String body) {
    final map = json.decode(body);
    return Apiresponse<T>(
      status: status == 200 || status == 201,
      message: map["message"] ?? "",
      data: map["data"],
      token: map["token"]
    );
  }
}
