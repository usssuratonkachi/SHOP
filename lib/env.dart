import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'injection.dart';

class Env {
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final injectionContainer = await injection(const App());
    runApp(injectionContainer);
  }
}
