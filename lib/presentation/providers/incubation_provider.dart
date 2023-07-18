

import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/incubation.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class IncubationProvider extends ChangeNotifier {
  Incubation? incubation;

  Future<ApiResponse> getIncubation(int idInc) async{
      incubation = null;
      try {
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.incubation(idInc);

      if (apiResponse.hasIncubations() && apiResponse.isOK()) {
        incubation = apiResponse.incubations!.first;
        notifyListeners();
      }
      return apiResponse;
    } catch (error) {
      return ApiResponse(status: 1, msg: 'Error del servidor');
    }
  }
}