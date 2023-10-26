// ignore_for_file: missing_provider_scope
import 'package:flutter/material.dart';
import 'package:notez/features/home/presentation/home_screen.dart';
import 'package:notez/features/note/note_dependency_injection.dart' as note_dependency_injection;
import 'package:notez/shared/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  note_dependency_injection.init();
  await NotezDatabase.database();

  runApp(const Notez());
}

class Notez extends StatelessWidget {
  const Notez({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
