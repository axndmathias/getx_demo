import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (_) {
        print("normal dispose");
      },
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
