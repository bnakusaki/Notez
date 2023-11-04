import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';

class HomeState extends ChangeNotifier {
  final noteBloc = sl<NoteBloc>();

  Future<Either<Exception, List<Note>>> getNotes() async {
    final response = await noteBloc.getNotes();
    return response;
  }
}
