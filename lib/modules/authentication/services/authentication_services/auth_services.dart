// ignore_for_file: avoid_print

import 'package:post_api_demo/core/app_config/app_base_client.dart';
import 'package:post_api_demo/core/app_config/app_urls.dart';
import 'package:post_api_demo/modules/authentication/model/user_model.dart';

class AuthenticationServices {
  static validateLoginInformation(requestBody) {
    try {
      var response = BaseClient.sharedList
          .postRequest(endpoint: AppUrl.login, requestBody: requestBody);
      print('response');
      print(response);
      return UserDetailsModel.fromJson(response);
    } catch (exception) {
      rethrow;
    }
  }
}
