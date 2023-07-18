import 'dart:convert';
import 'package:app_avicola/global/env.dart';
import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';



class ApiService{


  Future<ApiResponse> login(String nombreUsuario, String contrasena) async{
    final uri = Uri.parse('${Env.apiUrl}/api/login');

    final res = await http.post(uri, body:{
      'nombre_usuario': nombreUsuario,
      'contraseña': contrasena
    });
    
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


  Future<ApiResponse> register(String nombreUsuario, String contrasena, int id, String username) async{
    final uri = Uri.parse('${Env.apiUrl}/api/register');

    final res = await http.post(uri, body:{
      'nombre_usuario': nombreUsuario,
      'contraseña': contrasena,
      'id_rol': id.toString(),
      'username': username
    });

    // En caso de que el servidor responda (sin tomar en cuenta que la respuesta sea la esperada)
    if(res.statusCode == 200){
      final decoded = await json.decode(res.body);
      return ApiResponse.msgFromJson(decoded);
    }

    // En caso de que el servidor no responda
    return ApiResponse(status: 1, msg: 'Algo salió mal');
  }


  //Trae todos los usuarios (CRUD)
  Future<ApiResponse> users(int idRol) async{
    final uri = Uri.http(Env.authority,'/user', {'id_rol': idRol.toString()});
    
    final res = await http.get(uri);

    if(res.statusCode == 200){
      final decoded = json.decode(res.body);
      return ApiResponse.usersFromJson(decoded);
    }

    return ApiResponse(status: 1, msg: "Algo salió mal");
  }

  // Future<ApiResponse> delUser(int id) async{

  // }


  //Trae todos los galpones
  Future<ApiResponse> sheds() async{
    final uri = Uri.parse('${Env.apiUrl}/galpon');
    
    final res = await http.get(uri);

    if(res.statusCode == 200){
      final decoded = json.decode(res.body);
      return ApiResponse.shedsFromJson(decoded);
    }

    return ApiResponse(status: 1, msg: "Algo salió mal");
  }

  //Trae todas las vacunas
  Future<ApiResponse> vaccines() async{
    final uri = Uri.parse('${Env.apiUrl}/health/vac');

    final res = await http.get(uri);

    if(res.statusCode == 200){
      final decoded = json.decode(res.body);
      return ApiResponse.vaccinesFromJson(decoded);
    }

    return ApiResponse(status: 1, msg: "Algo salió mal");
  }

  //Trae todas las incubadoras
 Future<ApiResponse> incubators() async{
    final uri = Uri.parse('${Env.apiUrl}/prod/eggs/incu');
    final res = await http.get(uri);

    if(res.statusCode == 200){
      final decoded = json.decode(res.body);
      return ApiResponse.incubatorsFromJson(decoded);
    }

    return ApiResponse(status: 1, msg: "Algo salió mal");
 }

 //Trae la incubación por id
 Future<ApiResponse> incubation(int idInc) async{
    final uri = Uri.http(Env.authority,'/prod/eggs/incu/id', {'id_inc': idInc.toString()});
    final res = await http.get(uri);

    if(res.statusCode == 200){
      final decoded = json.decode(res.body);
      return ApiResponse.incubationFromJson(decoded);
    }

    return ApiResponse(status: 1, msg: "Algo salió mal");
 }

 //Trae repo mortalidad
  // Future<ApiResponse> getMortalidad(DateTime selectDay1, DateTime selectDay2) async{
  //   final uri = Uri.http(Env.authority, '/report', {'start': selectDay1.toString(), 'end': selectDay2.toString()});

  //   final res = await http.get(uri);

  //   // En caso de que el servidor responda (sin tomar en cuenta que la respuesta sea la esperada)
  //   if(res.statusCode == 200){
  //     final decoded = await json.decode(res.body);
  //     // return ApiResponse.dataFromJson(decoded);
  //   }

  //   // En caso de que el servidor no responda
  //   return ApiResponse(status: 1, msg: 'Algo salió mal');
  // }

}