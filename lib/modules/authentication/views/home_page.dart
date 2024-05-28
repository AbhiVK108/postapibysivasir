// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:post_api_demo/core/app_config/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.teal,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('wecome to home page'),
            SizedBox(
              height: 15.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('logout')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
