import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/Screens/dashboard_screen.dart';
import 'package:login_ui/utils/color.dart';
import 'package:login_ui/widgets/background.dart';
import 'package:login_ui/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Container(
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.08),
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: size.height * 0.3,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF3E4055), fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hint: "Email",
                    issecured: false,
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hint: "Password",
                    issecured: true,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.password,
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(fontSize: 15, color: primaryColor),
                    ),
                  ),
                  // SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(DashboardScreen());
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(primaryColor),
                        foregroundColor: MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      // onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))},
                      child: Text(
                        "Don't Have an Account? Sign up",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
