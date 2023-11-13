import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class CreateNote {
  CreateNote(this.repository);
  final NoteRepository repository;

  Future<Either<Exception, bool>> call() async => await repository.createNote();
}
