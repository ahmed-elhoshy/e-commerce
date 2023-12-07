import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_constants.dart';
import 'package:e_commerce/Data/Api/base_error.dart';
import 'package:e_commerce/Data/Model/Request/LoginRequest.dart';
import 'package:e_commerce/Data/Model/Request/RegisterRequest.dart';
import 'package:e_commerce/Data/Model/Response/CategoryOrBrandResponseDM.dart';
import 'package:e_commerce/Data/Model/Response/LoginResponse.dart';
import 'package:e_commerce/Data/Model/Response/ProductResponsDto.dart';
import 'package:e_commerce/Data/Model/Response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<Either<Failures, RegisterResponse>> register(String name, String email,
      String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(Failures(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, LoginResponse>> login(
      String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(Failures(errorMessage: loginResponse.message));
      }
    } else {
      return Left(Failures(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDm>> getCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.getAllCategoriesApi);

      var response = await http.get(url);
      var categoryResponse =
          CategoryOrBrandResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerErrors(errorMessage: categoryResponse.message));
      }
    } else {
      /// no internet connection
      return Left(
          NetworkErrors(errorMessage: 'Please Check Internet Connection'));
    }
  }

  Future<Either<Failures, ProductResponsDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.getAllProductsApi);

      var response = await http.get(url);
      var productResponse =
          ProductResponsDto.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerErrors(errorMessage: 'error'));
      }
    } else {
      /// no internet connection
      return Left(
          NetworkErrors(errorMessage: 'Please Check Internet Connection'));
    }
  }
}
