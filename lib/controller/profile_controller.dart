import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/user.dart';

class ProfileContoller extends GetxController {
  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();

    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
          title: Text("Error"),
          message: Text("Entre com um valor valido"),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: Text("Aceitar"),
          ),
        ),
      );
    }
  }
}
