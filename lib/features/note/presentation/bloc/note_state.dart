import 'package:notez/features/note/domain/entities/note.dart';

abstract class NoteState {}

class AllNotesState extends NoteState {
  final List<Note> notes;
  AllNotesState(this.notes);
}

class NoteOperationOngoing extends NoteState {}

class NoNote extends NoteState {}

class NoteInFocus extends NoteState {
  final Note note;

  NoteInFocus(this.note);
}

class FailedNoteOperation extends NoteState {}

class NoteDeleted extends NoteState {}
