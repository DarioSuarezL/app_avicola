// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
    int status;
    String? msg;
    String? data;

    ApiResponse({
        required this.status,
        this.msg,
        this.data,
    });

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        msg: json["msg"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data,
    };

  // funciones para verificar la condición del response

    // retorna true si no se trata de response de error
  bool isOK() => status == 0;

    // retorna true si tiene "data"
  bool hasData() => data != null || data != '';

    // retorna true si tiene "msg"
  bool hasMsg() => msg != null || msg != '';

}
