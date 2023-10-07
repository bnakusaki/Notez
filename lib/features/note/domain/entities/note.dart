import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notez/features/note/domain/entities/kind.dart';
import 'package:notez/features/note/domain/entities/location.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  factory Note({
    int? id,
    required String title,
    String? content,
    required DateTime createdOn,
    required DateTime lastUpdated,
    required Kind kind,
    List<int>? todos,
    int? folder,
    required Location location,
  }) = _Note;
}
