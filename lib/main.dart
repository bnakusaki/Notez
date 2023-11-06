import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notez/app.dart';
import 'package:notez/firebase_options.dart';

import 'injection_container.dart' as injection_container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  injection_container.init();

  runApp(const Notez());
}
