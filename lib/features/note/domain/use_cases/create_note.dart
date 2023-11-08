import 'package:dartz/dartz.dart';
import 'package:notez/features/note/domain/repository/note_repository.dart';

class CreateNote {
  CreateNote(this.repository);
  final NoteRepository repository;

  Future<Either<Exception, void>> call() async => await repository.createNote();
}
