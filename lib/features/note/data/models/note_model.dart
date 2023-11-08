import 'package:flutter/material.dart';
import 'package:notez/features/note/domain/entities/kind.dart';
import 'package:notez/features/note/domain/entities/location.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    String? userId,
    int? id,
    required String title,
    String? content,
    required DateTime createdOn,
    required DateTime lastUpdated,
    required Kind kind,
    List<int>? todos,
    int? folder,
    required Location location,
  }) : super(
          // id: id,
          title: title,
          content: content,
          createdOn: createdOn,
          lastUpdated: lastUpdated,
          kind: kind,
          todos: todos,
          folder: folder,
          location: location,
        );

  factory NoteModel.newNote() {
    return NoteModel(
      title: 'untitled note',
      createdOn: DateTime.now(),
      lastUpdated: DateTime.now(),
      kind: Kind.note,
      location: Location.localStorage,
    );
  }

  factory NoteModel.fromNote(Note note) {
    return NoteModel(
      // id: note.id,
      title: note.title,
      createdOn: note.createdOn,
      lastUpdated: note.lastUpdated,
      kind: note.kind,
      todos: note.todos,
      folder: note.folder,
      location: note.location,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
    return NoteModel(
      // id: json['id'],
      title: json['title'],
      createdOn: DateTime.parse(json['createdOn']),
      lastUpdated: DateTime.parse(json['lastUpdated']),
      kind: toKind(json['kind']),
      todos: json['todo'],
      folder: json['folder'],
      location: toLocation(json['location']),
    );
  }

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'title': title,
        'content': content,
        'createdOn': createdOn.toString(),
        'lastUpdated': lastUpdated.toString(),
        'kind': kind.name,
        'location': location.name,
      };
}
