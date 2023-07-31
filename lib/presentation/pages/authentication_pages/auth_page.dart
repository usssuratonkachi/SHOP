import 'package:flutter/material.dart';
import 'package:shop/presentation/pages/authentication_pages/sign_up_page.dart';
import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toogle)
      : SignUpPage(onClickedSignIn: toogle);

  void toogle() => setState(() {
        isLogin = !isLogin;
      });
}
