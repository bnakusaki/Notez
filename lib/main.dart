import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notez/features/note/note_dependency_injection.dart' as note_dependency_injection;
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';
import 'package:notez/shared/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  note_dependency_injection.init();
  await NotezDatabase.database();
  final bloc = sl<NoteBloc>();
  final Either<Exception, int> response = await bloc.createNote();

  debugPrint(response.toString());
}
