import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileContoller>(
      init: ProfileContoller(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${_.user.firstName} ${_.user.lastName}"),
              SizedBox(height: 10),
              CupertinoTextField(
                onChanged: _.onInputTextChanged,
              ),
              SizedBox(height: 10),
              CupertinoButton(
                  child: Text("Aceitar"), onPressed: _.goToBackWithData),
            ],
          ),
        ),
      ),
    );
  }
}
