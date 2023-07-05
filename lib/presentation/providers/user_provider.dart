import 'dart:ffi';

import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/user.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? user;
  // String? msg;


  Future<ApiResponse> loginUser(String nombreUsuario, String contrasena) async{
    try{
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.login(nombreUsuario, contrasena);
        if(apiResponse.hasUser() && apiResponse.isOK()){
          user = apiResponse.user;
          notifyListeners();
        }
        return apiResponse;

    }catch(e){
      return ApiResponse(status: 1, msg: 'Error del servidor');
      
    }
  }

  Future<ApiResponse> registerUser(String nombreUsuario, String contrasena, int id, String username) async{
    ApiService apiService = ApiService();
    ApiResponse apiResponse = await apiService.register(nombreUsuario, contrasena, id, username);
    return apiResponse;
  }

}
