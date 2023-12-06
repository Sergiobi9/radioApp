import 'dart:convert';
import 'dart:developer';

import 'package:radio_app/core/data_source/interface/i_base_data_source.dart';
import 'package:radio_app/environment/environment.dart';

import 'package:http/http.dart' as http;

class BaseDataSource implements IBaseDataSource {
  @override
  Future<dynamic> get(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    final response = await http.get(
        Uri.http(Environment.BASE_URL, endpoint, queryParameters),
        headers: headers);

    var decodedResponse = json.decode(response.body);
    return decodedResponse;
  }
}
