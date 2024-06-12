import 'package:flutter_fic8_final_g3/common/constants/variables.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_fic8_final_g3/data/models/request/auth_request_model.dart';
import 'package:flutter_fic8_final_g3/data/models/response/auth_response_model.dart';
import 'package:flutter_fic8_final_g3/data/models/response/user_profile_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login({
    required AuthRequestModel requestModel,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    const baseUrl = "${Variables.baseUrl}/api/login";

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: requestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Login Failed');
    }
  }

  Future<Either<String, String>> logout() async {
    //get token from device storage
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };
    const baseUrl = "${Variables.baseUrl}/api/logout";

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      //return success message
      return const Right('Logout Successfully');
    } else {
      return const Left('Logout Failed');
    }
  }

  Future<Either<String, UserProfileResponseModel>> getUserProfile() async {
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/user";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(UserProfileResponseModel.fromJson(response.body));
    } else {
      return const Left("Failed fetching user profile");
    }
  }
}
