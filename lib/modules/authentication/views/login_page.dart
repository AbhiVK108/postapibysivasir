// ignore_for_file: avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:post_api_demo/core/app_config/app_base_client.dart';
import 'package:post_api_demo/core/app_config/app_colors.dart';
import 'package:post_api_demo/core/app_config/app_utils.dart';
import 'package:post_api_demo/modules/authentication/model/user_model.dart';
import 'package:post_api_demo/modules/authentication/services/authentication_services/auth_services.dart';
import 'package:post_api_demo/modules/authentication/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  validateTextField() {
    if (_usernameController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      AppUtils.sharedUtils.alert(
          context: context, title: "Error!", message: "please fill the text");
    } else {
      validateUserAuthenticationOnServer();
      print('please fill textFields');
    }
  }

  validateUserAuthenticationOnServer() async {
    var requestBody = {
      "username": _usernameController.text,
      "password": _passwordController.text,
    };
    try {
      UserDetailsModel response =
          await AuthenticationServices.validateLoginInformation(requestBody);
      print(response);
      // ignore: unnecessary_null_comparison
      if (response != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
                child: Text('Login failed: please enter correct details')),
          ),
        );
      }
      return response;
    } catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Center(child: Text('Login failed: please enter correct details')),
        ),
      );
      print(exception);
    }
  }

  BaseClient loginUser = BaseClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.teal,
        title: const Text('post method'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your Email'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Your password'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                  onPressed: validateTextField,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.teal)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Login',
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
