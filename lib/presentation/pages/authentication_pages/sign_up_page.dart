import 'package:api/api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/widgets/input_fields.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _errorMessage = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUpWithEmailAndPassword() async {
    try {
      await AuthenticationRepository().signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      AccessKeyApiClient().getUserAccessKey();
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      setState(() {});
      _errorMessage = e.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: const Text(
          'SHOP(регистрация)',
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: InputField(
                      labelText: 'Email', controller: _emailController)),
              const SizedBox(
                height: 50,
              ),
              InputField(
                  labelText: 'Password', controller: _passwordController),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                  child: Text(
                    '$_errorMessage',
                    textAlign: TextAlign.center,
                  )),
              MaterialButton(
                onPressed: signUpWithEmailAndPassword,
                shape: const StadiumBorder(),
                color: Colors.lightBlueAccent,
                splashColor: Colors.lightBlueAccent,
                highlightColor: Colors.lightBlueAccent,
                child: const Text('зарегистрироваться'),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: TextSpan(text: 'Уже есть аккаунт?', children: [
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignIn,
                    text: 'Войти',
                    style:
                        const TextStyle(decoration: TextDecoration.underline))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
