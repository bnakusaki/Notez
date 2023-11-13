import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/note/domain/entities/note.dart';
import 'package:notez/features/note/note_dependency_injection.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/future_operation_state.dart';
import 'package:notez/features/note/presentation/presentation_logic_holders/note_bloc.dart';

class AllNotesPageStateCubit extends Cubit<FutureOperationState> {
  AllNotesPageStateCubit() : super(Initial());

  createNote() async {
    try {
      emit(Loading());
      await sl<NoteBloc>().createNote();
      emit(Success());
    } catch (e) {
      emit(Failure('Failed to create note'));
    }
  }
}

class CurrentNoteCubit extends Cubit<Note?> {
  CurrentNoteCubit() : super(null);

  Future<void> setNote(String noteId) async {
    final response = await sl<NoteBloc>().readNote(noteId);
    return emit(response);
  }

  void updateContent(String? content) {
    state!.content = content;
  }

  Future<void> updateNote() async {
    await sl<NoteBloc>().updateNote(state!);
  }
}
