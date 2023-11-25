import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/note/domain/use_cases/create_note.dart';
import 'package:notez/features/note/domain/use_cases/delete_note.dart';
import 'package:notez/features/note/domain/use_cases/get_notes.dart';
import 'package:notez/features/note/domain/use_cases/read_note.dart';
import 'package:notez/features/note/domain/use_cases/update_note.dart';
import 'package:notez/features/note/presentation/bloc/note_events.dart';
import 'package:notez/features/note/presentation/bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(
    this._createNote,
    this._readNote,
    this._updateNote,
    this._deleteNote,
    this._getNotes,
  ) : super(NoNote()) {
    on<GetAllNotesEvent>((event, emit) async {
      emit(NoteOperationOngoing());
      final response = await _getNotes();
      emit(AllNotesState(response));
    });

    on<ReadNoteEvent>((event, emit) async {
      emit(NoteOperationOngoing());
      final response = await _readNote(event.id);
      response.fold((l) {
        emit(FailedNoteOperation());
      }, (note) {
        emit(NoteInFocus(note));
      });
    });

    on<UpdateNoteEvent>((event, emit) async {
      await _updateNote(event.note);
    });
    on<CerateNoteEvent>((event, emit) async {
      emit(NoteOperationOngoing());
      await _createNote();
      final response = await _getNotes();
      emit(AllNotesState(response));
    });

    on<DeleteNoteEvent>((event, emit) async {
      emit(NoteOperationOngoing());
      await _deleteNote(event.id);
      final response = await _getNotes();
      emit(AllNotesState(response));
    });
  }

  final ReadNote _readNote;
  final UpdateNote _updateNote;
  final GetNotes _getNotes;
  final DeleteNote _deleteNote;
  final CreateNote _createNote;
}
