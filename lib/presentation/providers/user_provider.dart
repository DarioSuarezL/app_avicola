import 'dart:ffi';

import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/user.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? user;


  Future<ApiResponse> loginUser(String nombreUsuario, String contrasena) async{
    ApiService apiService = ApiService();
    ApiResponse apiResponse = await apiService.login(nombreUsuario, contrasena);
      if(apiResponse.hasUser() && apiResponse.isOK()){
        user = apiResponse.user;
        notifyListeners();
      }
    return apiResponse;
  }

}
