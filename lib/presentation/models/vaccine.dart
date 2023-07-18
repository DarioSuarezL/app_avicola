// To parse this JSON data, do
//
//     final vaccine = vaccineFromJson(jsonString);

import 'dart:convert';

Vaccine vaccineFromJson(String str) => Vaccine.fromJson(json.decode(str));

String vaccineToJson(Vaccine data) => json.encode(data.toJson());

class Vaccine {
    int idVac;
    String nombre;
    String? descripcion;

    Vaccine({
        required this.idVac,
        required this.nombre,
        this.descripcion,
    });

    factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        idVac: json["id_vac"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id_vac": idVac,
        "nombre": nombre,
        "descripcion": descripcion,
    };
}
