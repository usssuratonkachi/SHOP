import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/widgets/input_fields.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _errorMessage = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signInWithEmailAndPassword() async {
    try {
      await AuthenticationRepository().logInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on LogInWithEmailAndPasswordFailure catch (e) {
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
          'SHOP(вход)',
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
                onPressed: signInWithEmailAndPassword,
                shape: const StadiumBorder(),
                color: Colors.lightBlueAccent,
                splashColor: Colors.lightBlueAccent,
                highlightColor: Colors.lightBlueAccent,
                child: const Text('войти'),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: TextSpan(text: 'Нет аккаунта?', children: [
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Зарегистрироваться',
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
