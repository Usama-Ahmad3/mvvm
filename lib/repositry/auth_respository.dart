import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiServices.dart';

import '../res/appUrl.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.PostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
