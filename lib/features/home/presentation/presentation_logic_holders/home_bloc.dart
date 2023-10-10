import 'package:notez/features/home/domain/use_cases/get_notes.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class HomeBloc {
  HomeBloc(this.get);
  final GetNotes get;

  Future<List<Note>?> getNotes() async {
    return await get();
  }
}
