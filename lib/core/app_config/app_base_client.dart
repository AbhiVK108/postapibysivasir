// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:post_api_demo/core/app_config/app_keys.dart';
import 'package:post_api_demo/core/app_config/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:post_api_demo/modules/authentication/views/login_page.dart';

class BaseClient {
  static BaseClient sharedList = BaseClient();

  requestHeaders() {
    return <String, String>{
      'Content-Type': 'application/json',
    };
  }

   Future<dynamic> postRequest(
      {required String endpoint, required dynamic requestBody}) async {
    final uri = Uri.parse(AppUrl.baseUrl + endpoint);
    final response = await http.post(uri,
        headers: requestHeaders(), body: json.encode(requestBody));
    print(response);
    return processResponse(response);
  } 
}

 dynamic processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      //............................decoder here..................................//
      try {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);
        return decodedResponse;

      } catch (exception) {
        
        print(exception);
        
      }
    case 400:
      Navigator.of(AppKeys.navigatorkey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
          (route) => false);
  }
}
