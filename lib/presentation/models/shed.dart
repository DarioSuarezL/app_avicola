// To parse this JSON data, do
//
//     final shed = shedFromJson(jsonString);

import 'dart:convert';

Shed shedFromJson(String str) => Shed.fromJson(json.decode(str));

String shedToJson(Shed data) => json.encode(data.toJson());

class Shed {
    int idGalpon;
    String dimension;
    int capacidad;
    int capacidadLibre;
    bool enCuar;
    List<Batch> lotes;

    Shed({
        required this.idGalpon,
        required this.dimension,
        required this.capacidad,
        required this.capacidadLibre,
        required this.enCuar,
        required this.lotes,
    });

    factory Shed.fromJson(Map<String, dynamic> json) => Shed(
        idGalpon: json["id_galpon"],
        dimension: json["dimension"],
        capacidad: json["capacidad"],
        capacidadLibre: json["capacidad_libre"],
        enCuar: json["en_cuar"],
        lotes: List<Batch>.from(json["lotes"].map((x) => Batch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_galpon": idGalpon,
        "dimension": dimension,
        "capacidad": capacidad,
        "capacidad_libre": capacidadLibre,
        "en_cuar": enCuar,
        "lotes": List<dynamic>.from(lotes.map((x) => x.toJson())),
    };
}

class Batch {
    int idLote;
    String nombre;
    int cantidad;
    int mortalidad;

    Batch({
        required this.idLote,
        required this.nombre,
        required this.cantidad,
        required this.mortalidad,
    });

    factory Batch.fromJson(Map<String, dynamic> json) => Batch(
        idLote: json["id_lote"],
        nombre: json["nombre"],
        cantidad: json["cantidad"],
        mortalidad: json["mortalidad"],
    );

    Map<String, dynamic> toJson() => {
        "id_lote": idLote,
        "nombre": nombre,
        "cantidad": cantidad,
        "mortalidad": mortalidad,
    };
}