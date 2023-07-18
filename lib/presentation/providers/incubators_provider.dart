import 'package:app_avicola/presentation/models/api_response.dart';
import 'package:app_avicola/presentation/models/incubator.dart';
import 'package:app_avicola/presentation/services/api_service.dart';
import 'package:flutter/material.dart';

class IncubatorsProvider extends ChangeNotifier {
  List<Incubator>? incubators;

  Future<ApiResponse> getIncubators() async {
    try {
      ApiService apiService = ApiService();
      ApiResponse apiResponse = await apiService.incubators();

      if (apiResponse.hasIncubators() && apiResponse.isOK()) {
        incubators = apiResponse.incubators;
        notifyListeners();
      }
      return apiResponse;
    } catch (error) {

      return ApiResponse(status: 1, msg: 'Error del servidor');
      
    }
  }

}