import 'package:app_avicola/presentation/models/api_response.dart';
// import 'package:app_avicola/presentation/models/user.dart';
import 'package:app_avicola/presentation/models/user_data.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier{
  List<UserData>? users;

  Future<ApiResponse> getUsers(int idRol) async{
    try{
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.users(idRol);
      if(apiResponse.hasUsers() && apiResponse.isOK()){
        users = apiResponse.users;
        notifyListeners();
      }
      // print("Si sirve xd");
      return apiResponse;

    }catch(e){
      return ApiResponse(status: 1, msg: 'Error del servidor');
    }
  }



}