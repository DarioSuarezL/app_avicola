// To parse this JSON data, do
//
//     final incubation = incubationFromJson(jsonString);

import 'dart:convert';

Incubation incubationFromJson(String str) => Incubation.fromJson(json.decode(str));

String incubationToJson(Incubation data) => json.encode(data.toJson());

class Incubation {
    int idIncub;
    String? inicio;
    String? finalizacion;
    int? nroHuevos;
    int? nroEclosionado;
    bool? finalizado;
    int idInc;

    Incubation({
        required this.idIncub,
        this.inicio,
        this.finalizacion,
        this.nroHuevos,
        this.nroEclosionado,
        this.finalizado,
        required this.idInc,
    });

    factory Incubation.fromJson(Map<String, dynamic> json) => Incubation(
        idIncub: json["id_incub"],
        inicio: json["inicio"],
        finalizacion: json["finalizacion"],
        nroHuevos: json["nro_huevos"],
        nroEclosionado: json["nro_eclosionado"],
        finalizado: json["finalizado"],
        idInc: json["id_inc"],
    );

    Map<String, dynamic> toJson() => {
        "id_incub": idIncub,
        "inicio": inicio,
        "finalizacion": finalizacion,
        "nro_huevos": nroHuevos,
        "nro_eclosionado": nroEclosionado,
        "finalizado": finalizado,
        "id_inc": idInc,
    };
}