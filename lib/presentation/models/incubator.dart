// To parse this JSON data, do
//
//     final incubator = incubatorFromJson(jsonString);

import 'dart:convert';

Incubator incubatorFromJson(String str) => Incubator.fromJson(json.decode(str));

String incubatorToJson(Incubator data) => json.encode(data.toJson());

class Incubator {
    int idInc;
    bool disponible;
    String? inicio;
    int? nroHuevos;
    int? idIncub;

    Incubator({
        required this.idInc,
        required this.disponible,
        this.inicio,
        this.nroHuevos,
        this.idIncub,
    });

    factory Incubator.fromJson(Map<String, dynamic> json) => Incubator(
        idInc: json["id_inc"],
        disponible: json["disponible"],
        inicio: json["inicio"],
        nroHuevos: json["nro_huevos"],
        idIncub: json["id_incub"],
    );

    Map<String, dynamic> toJson() => {
        "id_inc": idInc,
        "disponible": disponible,
        "inicio": inicio,
        "nro_huevos": nroHuevos,
        "id_incub": idIncub,
    };
}