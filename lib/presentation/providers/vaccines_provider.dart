import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/vaccine.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class VaccinesProvider with ChangeNotifier{
  List<Vaccine>? vaccines;
  
  Future<ApiResponse> getVaccines() async{
    try{
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.vaccines();
      
      if(apiResponse.hasVaccines() && apiResponse.isOK()){
        vaccines = apiResponse.vaccines;
        notifyListeners();
      }
      return apiResponse;
    }catch(e){
      return ApiResponse(status: 1, msg: 'Error del servidor');
    }
  }

}