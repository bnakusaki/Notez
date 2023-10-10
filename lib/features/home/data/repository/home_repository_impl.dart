import 'package:notez/features/home/data/database/local/local_database.dart';
import 'package:notez/features/home/domain/repository/home_repository.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.localDatabase);

  final LocalDatabase localDatabase;
  @override
  Future<List<Note>?> getNotes() async {
    return await localDatabase.getNotes();
  }
}
