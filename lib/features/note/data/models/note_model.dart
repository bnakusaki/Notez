import 'package:flutter/material.dart';
import 'package:notez/features/note/domain/entities/kind.dart';
import 'package:notez/features/note/domain/entities/location.dart';
import 'package:notez/features/note/domain/entities/note.dart';

class NoteModel {
  NoteModel({
    this.id,
    required this.title,
    this.content,
    required this.createdOn,
    required this.lastUpdated,
    required this.kind,
    this.todos,
    this.folder,
    required this.location,
  });
  int? id;
  String title;
  String? content;
  DateTime createdOn;
  DateTime lastUpdated;
  Kind kind;
  List<int>? todos;
  int? folder;
  Location location;

  factory NoteModel.newNote() {
    return NoteModel(
      title: 'untitled note',
      createdOn: DateTime.now(),
      lastUpdated: DateTime.now(),
      kind: Kind.note,
      location: Location.localStorage,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
    return NoteModel(
      id: json['id'],
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
        'title': title,
        'content': content,
        'createdOn': createdOn.toString(),
        'lastUpdated': lastUpdated.toString(),
        'kind': kind.name,
        'location': location.name,
      };

  Note toNote() {
    return Note(
      title: title,
      createdOn: createdOn,
      lastUpdated: lastUpdated,
      kind: kind,
      location: location,
    );
  }
}
