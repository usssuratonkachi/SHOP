import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/pages/catalog_page.dart';

import 'package:shop/presentation/pages/authentication_pages/auth_page.dart';

class AuthenticationWidgetTree extends StatefulWidget {
  const AuthenticationWidgetTree({Key? key}) : super(key: key);

  @override
  State<AuthenticationWidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<AuthenticationWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthenticationRepository().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('что-то пошло не так'));
        } else if (snapshot.hasData) {
          return const CatalogPage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
