import 'dart:convert';
import 'dart:math';
import '../models/single_survey_model.dart';

import '../models/survey_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String username = "";
  static String password = "";

  static var client = http.Client();
  static String apiURL =
      "http://172.16.50.102:8080/easyplanweb/api/smart/qos/survey/";

  /// Auth User ///

  Future<bool> userLogin(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Map<String, String> requsetHeaders = {
      'tenant': 'Default',
      'SABANET-PRODUCT': 'EasyPlanGate',
      'idNodo': '0',
      'authorization': basicAuth
    };
    var response = await client.get(
      Uri.parse(apiURL),
      headers: requsetHeaders,
    );
    if (response.statusCode == 200) {
      ApiServices.username = username;
      ApiServices.password = password;
      return true;
    }
    return false;
  }

  /// Fetch Survey List ///

  static Future<List<Survey>> getSurveryList() async {
    if (ApiServices.username.length < 1 && ApiServices.password.length < 1) {
      throw StateError("error message");
    }

    String basicAuth = 'Basic ' +
        base64Encode(
            utf8.encode('${ApiServices.username}:${ApiServices.password}'));
    Map<String, String> requsetHeaders = {
      'tenant': 'Default',
      'SABANET-PRODUCT': 'EasyPlanGate',
      'idNodo': '0',
      'authorization': basicAuth
    };
    var response = await client.get(
      Uri.parse(apiURL),
      headers: requsetHeaders,
    );
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      // print(jsonString);
      return jsonString.map<Survey>(Survey.fromJson).toList();
      // return jsonString.map((job) => Survey.fromJson(job)).toList();
      // List<Survey> convertedData = jsonString.map(i) => Survey.fromJson(i)
      // List<Survey> survey = List<Survey>.from(jsonString.map((model)=> Survey.fromJson(model)));
      // Survey.fromJson(jsonString);
      // Survey.fromJson(jsonDecode(jsonString[0]));

      // List<Survey>.from(json(jsonString));
      // return convertedData;
    } else {
      // return [];
      throw Exception('Failed to load data');
    }
  }

  /// Get Single Survey ///

  static Future<SingleSurvey> getSingleSurvey(surveyId) async {
    if (ApiServices.username.length < 1 && ApiServices.password.length < 1) {
      throw StateError("error message");
    }

    String basicAuth = 'Basic ' +
        base64Encode(
            utf8.encode('${ApiServices.username}:${ApiServices.password}'));
    Map<String, String> requsetHeaders = {
      'tenant': 'Default',
      'SABANET-PRODUCT': 'EasyPlanGate',
      'idNodo': '0',
      'authorization': basicAuth
    };
    final response = await client.get(
      Uri.parse(apiURL + surveyId),
      headers: requsetHeaders,
    );
    var jsonString = json.decode(response.body);
    // print('singleSurveyyyyy $jsonString');
    return SingleSurvey.fromJson(jsonString);
  }
}
