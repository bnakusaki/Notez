import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class DeleteNote {
  DeleteNote(this.repository);
  final NoteRepository repository;

  Future<Either<Exception, int>> call(int id) async => await repository.deleteNote(id);
}
