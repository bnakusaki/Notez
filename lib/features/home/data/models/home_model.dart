import 'package:notez/features/home/domain/entities/home.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class HomeModel extends Home {
  HomeModel({
    List<Note>? notes,
  }) : super(notes: notes);

  // factory HomeModel.fromJson(Map<String, dynamic> json) {
  //   HomeModel();
  // }
}
