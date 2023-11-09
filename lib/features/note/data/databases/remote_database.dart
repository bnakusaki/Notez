import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notez/features/note/data/models/note_model.dart';

abstract class RemoteDatabase {
  Future<Either<Exception, void>> createNote();
  Future<Either<Exception, NoteModel>> readNote(int id);
  updateNote(NoteModel noteModel);
  Future<Either<Exception, int>> deleteNote(int id);
  Future<List<NoteModel>> getNotes();
}

class RemoteDatabaseImpl implements RemoteDatabase {
  @override
  Future<Either<Exception, void>> createNote() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final note = NoteModel.newNote().toJson();
      final db = FirebaseFirestore.instance;
      db.collection('userNotes').doc(currentUser.uid).collection('notes').add(note);
      return const Right(null);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    return await FirebaseFirestore.instance
        .collection('userNotes')
        .doc(currentUser.uid)
        .collection('notes')
        .get()
        .then(
          (value) => value.docs.map((e) {
            final response = NoteModel.fromJson(e.data()).copyWith(id: e.id);
            debugPrint('==== ${response.content}');
            return response;
          }).toList(),
        );
  }

  @override
  Future<Either<Exception, int>> deleteNote(int id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, NoteModel>> readNote(int id) {
    // TODO: implement readNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(NoteModel noteModel) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final docRef = FirebaseFirestore.instance
        .collection('userNotes')
        .doc(currentUser.uid)
        .collection('notes')
        .doc(noteModel.id);

    await docRef.update({'content': noteModel.content});
  }
}
