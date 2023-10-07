import 'package:notez/features/note/domain/repository/note_repository.dart';

class CreateNote {
  CreateNote(this.repository);
  final NoteRepository repository;

  Future<int> call() async => await repository.createNote();
}
