import 'package:flutter/material.dart';
import 'package:shop/presentation/widgets/authentication_widget_tree.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AuthenticationWidgetTree());
  }
}
