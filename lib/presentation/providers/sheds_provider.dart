import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/shed.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class ShedsProvider with ChangeNotifier{
  List<Shed>? sheds;

  Future<ApiResponse> getSheds() async{
    try{
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.sheds();

      if(apiResponse.hasSheds() && apiResponse.isOK()){
        sheds = apiResponse.sheds;
        notifyListeners();
      }
      return apiResponse;
    }catch(error){
      return ApiResponse(status: 1, msg: 'Error del servidor');
    }
  }
  
}