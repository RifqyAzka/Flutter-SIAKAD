import 'package:flutter_fic8_final_g3/common/constants/variables.dart';
import 'package:flutter_fic8_final_g3/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_fic8_final_g3/data/models/response/schedules_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class SchedulesRemoteDataSource {
  Future<Either<String, SchedulesResponseModel>> getSchedules() async {
    //get user token from local
    final loginToken = await AuthLocalDataSources().getToken();

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $loginToken',
    };

    const baseUrl = "${Variables.baseUrl}/api/schedules";

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(SchedulesResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed get Student Khs');
    }
  }
}
