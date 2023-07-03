import 'dart:convert';
import 'package:app_avicola/global/env.dart';
import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';



class ApiService{
  Future<ApiResponse> login(String nombreUsuario, String contrasena) async{
    final uri = Uri.parse('${Env.apiUrl}/api/login');
    // final String data = json.encode();

    final res = await http.post(uri, body:{
      'nombre_usuario': nombreUsuario,
      'contraseña': contrasena
    });
    print(res.body);
    // En caso de que el servidor responda (sin tomar en cuenta que la respuesta sea la esperada)
    if(res.statusCode == 200){
      final decoded = await json.decode(res.body);
      if(decoded['status'] == 0){
        return ApiResponse.userFromJson(decoded);
      }
      return ApiResponse.msgFromJson(decoded);
    }
    
    // En caso de que el servidor no responda
    return ApiResponse(status: 1, msg: 'Algo salió mal');
  }
}