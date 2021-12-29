import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  setBody() {
    return ({
      "email": emailController.text,
      "password": passController.text,
      "fto": "",
      "hex": "",
      "newUser": false,
    });
  }
}
