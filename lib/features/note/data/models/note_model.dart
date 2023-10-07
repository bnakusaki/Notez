import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notez/features/note/domain/entities/kind.dart';
import 'package:notez/features/note/domain/entities/location.dart';

part 'note_model.freezed.dart';

@freezed
class NoteModel with _$NoteModel {
  factory NoteModel({
    int? id,
    required String title,
    String? content,
    required DateTime createdOn,
    required DateTime lastUpdated,
    required Kind kind,
    List<int>? todos,
    int? folder,
    required Location location,
  }) = _NoteModel;

  NoteModel._();

  factory NoteModel.newNote() {
    return NoteModel(
      title: 'untitled note',
      createdOn: DateTime.now(),
      lastUpdated: DateTime.now(),
      kind: Kind.note,
      location: Location.localStorage,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'createdOn': createdOn.toString(),
        'lastUpdated': lastUpdated.toString(),
        'kind': kind.name,
        'location': location.name,
      };
}
