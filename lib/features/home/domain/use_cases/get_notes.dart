import 'package:notez/features/home/domain/repository/home_repository.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class GetNotes {
  GetNotes(this.repository);

  final HomeRepository repository;

  Future<List<Note>?> call() async {
    return await repository.getNotes();
  }
}
