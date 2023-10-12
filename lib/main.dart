import 'package:flutter/material.dart';
import 'package:notez/features/home/home_dependency_injection.dart' as home_injection;
import 'package:notez/features/note/note_dependency_injection.dart' as note_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  note_injection.init();
  home_injection.init();
}
