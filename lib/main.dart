import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rest_countries/views/homePage.dart';
import 'package:rest_countries/views/loginPage.dart';

import 'firebase_options.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
