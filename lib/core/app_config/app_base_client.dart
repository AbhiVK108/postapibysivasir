// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  postRequest({required String endpoint, required dynamic requestBody}) async {
    final uri = Uri.parse(AppUrl.baseUrl + AppUrl.auth + endpoint);
    final response = await http.post(uri,
        headers: requestHeaders(), body: json.encode(requestBody));
    return processResponse(response);
  }
}

processResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.body;
    case 201:
      return response.body;
    case 400:
      Navigator.of(AppKeys.navigatorkey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
          (route) => false);
  }
}
