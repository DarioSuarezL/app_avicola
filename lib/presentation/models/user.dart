

class User {
  int idUser;
  String nombreUsuario;
  int idRol;
  List<String> permisos;
  String token;

  User({
    required this.idUser,
    required this.nombreUsuario,
    required this.idRol,
    required this.permisos,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["id_user"],
    nombreUsuario: json["nombre_usuario"],
    idRol: json["id_rol"],
    permisos: List<String>.from(json["permisos"].map((x) => x)),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "nombre_usuario": nombreUsuario,
    "id_rol": idRol,
    "permisos": List<dynamic>.from(permisos.map((x) => x)),
    "token": token,
  };
}