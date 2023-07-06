// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

// import 'dart:convert';

import 'package:app_avicola/presentation/models/user.dart';
import 'package:app_avicola/presentation/models/user_data.dart';

// ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

// String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    int status;
    String? msg;
    User? user;
    List<UserData>? users; //Lista de usuarios en general

    ApiResponse({
        required this.status,
        this.msg,
        this.user,
        this.users,
    });


    // Posibles responses para login y register

    factory ApiResponse.userFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      user: User.fromJson(json["data"]),
    );

    factory ApiResponse.msgFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      msg: json["msg"],
    );



    Map<String, dynamic> userToJson() => {
      "status": status,
      "msg": msg,
      "user": user!.toJson(),
    };

    // Posibles responses para obtener usuarios ( CRUD )

    factory ApiResponse.usersFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      users: List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
    );


  // funciones para verificar la condición del response
    // retorna true si no se trata de response de error
  bool isOK() => status == 0;

    // retorna true si tiene "data"
  bool hasUser() => user != null;

    // retorna true si tiene "msg"
  bool hasMsg() => msg != null || msg != '';

    // retorna true si tiene La lista de usuarios
  bool hasUsers() => users != null;
}
