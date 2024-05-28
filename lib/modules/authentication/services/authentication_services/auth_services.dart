// ignore_for_file: avoid_print

import 'package:post_api_demo/core/app_config/app_base_client.dart';
import 'package:post_api_demo/core/app_config/app_urls.dart';
import 'package:post_api_demo/modules/authentication/model/user_model.dart';

class AuthenticationServices {
  static Future<UserDetailsModel> validateLoginInformation(Map<String, String>requestBody) async {
    try {
      var response = await BaseClient.sharedList
          .postRequest(endpoint: AppUrl.login, requestBody: requestBody);
     
        // print('response of authenticationService');
        print(response);
        // print('auth service ...');
        //...........not returning here ............// 
        return UserDetailsModel.fromJson(response);

    } catch (exception) {
      rethrow;
    }
  }
}
