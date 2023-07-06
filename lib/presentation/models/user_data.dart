// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    int idUser;
    String nombreUsuario;
    int idRol;
    int error;
    dynamic hora;
    bool bloqueado;
    Rol rol;

    UserData({
        required this.idUser,
        required this.nombreUsuario,
        required this.idRol,
        required this.error,
        this.hora,
        required this.bloqueado,
        required this.rol,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        idUser: json["id_user"],
        nombreUsuario: json["nombre_usuario"],
        idRol: json["id_rol"],
        error: json["error"],
        hora: json["hora"],
        bloqueado: json["bloqueado"],
        rol: Rol.fromJson(json["Rol"]),
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nombre_usuario": nombreUsuario,
        "id_rol": idRol,
        "error": error,
        "hora": hora,
        "bloqueado": bloqueado,
        "Rol": rol.toJson(),
    };
}

class Rol {
    String nombre;

    Rol({
        required this.nombre,
    });

    factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
    };
}