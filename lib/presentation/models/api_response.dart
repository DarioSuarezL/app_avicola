// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

// import 'dart:convert';

import 'package:app_avicola/presentation/models/incubation.dart';
import 'package:app_avicola/presentation/models/incubator.dart';
import 'package:app_avicola/presentation/models/shed.dart';
import 'package:app_avicola/presentation/models/user.dart';
import 'package:app_avicola/presentation/models/user_data.dart';
import 'package:app_avicola/presentation/models/vaccine.dart';

// ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

// String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    int status;
    String? msg;
    User? user;
    List<UserData>? users; //Lista de usuarios en general
    List<Shed>? sheds; //Lista de galpones
    List<Vaccine>? vaccines;
    List<Incubator>? incubators;
    List<Incubation>? incubations;

    ApiResponse({
        required this.status,
        this.msg,
        this.user,
        this.users,
        this.sheds,
        this.vaccines,
        this.incubators,
        this.incubations,
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

    // Posibles responses para obtener galpones (CRUD)

    factory ApiResponse.shedsFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      sheds: List<Shed>.from(json["data"].map((x) => Shed.fromJson(x))),
      // users: List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
    );


    // Posibles responses para obtener vacunas (CRUD)
    factory ApiResponse.vaccinesFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      vaccines: List<Vaccine>.from(json["data"].map((x) => Vaccine.fromJson(x))),
    );

    // Posibles responses para obtener incubadoras
    factory ApiResponse.incubatorsFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      incubators: List<Incubator>.from(json["data"].map((x) => Incubator.fromJson(x))),
    );

    factory ApiResponse.incubationFromJson(Map<String, dynamic> json) => ApiResponse(
      status: json["status"],
      incubations: List<Incubation>.from(json["data"].map((x) => Incubation.fromJson(x))),
    );


  // funciones para verificar la condición del response
  bool hasIncubations() => incubations != null;
    // retorna true si tiene "incubators"
  bool hasIncubators() => incubators != null;
  
    // retorna true si tiene "vaccines"
  bool hasVaccines() => vaccines != null;

    // retorna true si no se trata de response de error
  bool isOK() => status == 0;

    // retorna true si tiene "data"
  bool hasUser() => user != null;

    // retorna true si tiene "msg"
  bool hasMsg() => msg != null;

    // retorna true si tiene La lista de usuarios
  bool hasUsers() => users != null;

    // retorna true si tiene La lista de galpones
  bool hasSheds() => sheds != null;
}
