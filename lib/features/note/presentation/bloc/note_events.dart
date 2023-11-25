import 'package:notez/features/note/domain/entities/note.dart';

abstract class NoteEvent {}

class ReadNoteEvent extends NoteEvent {
  final String id;

  ReadNoteEvent(this.id);
}

class GetAllNotesEvent extends NoteEvent {}

class UpdateNoteEvent extends NoteEvent {
  final Note note;

  UpdateNoteEvent(this.note);
}

class CerateNoteEvent extends NoteEvent {}

class DeleteNoteEvent extends NoteEvent {
  final String id;

  DeleteNoteEvent(this.id);
}
