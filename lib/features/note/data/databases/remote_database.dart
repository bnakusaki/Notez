import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notez/features/note/data/models/note_model.dart';

abstract class RemoteDatabase {
  Future<Either<Exception, bool>> createNote();
  Future<NoteModel> readNote(String noteId);
  updateNote(NoteModel noteModel);
  Future<Either<Exception, int>> deleteNote(int id);
  Future<List<NoteModel>> getNotes();
}

class RemoteDatabaseImpl implements RemoteDatabase {
  @override
  Future<Either<Exception, bool>> createNote() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final note = NoteModel.newNote().toJson();
      final db = FirebaseFirestore.instance;
      db.collection('userNotes').doc(currentUser.uid).collection('notes').add(note);
      return const Right(true);
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
        .orderBy('lastUpdated', descending: true)
        .get()
        .then(
          (value) => value.docs.map((e) {
            final response = NoteModel.fromJson(e.data()).copyWith(id: e.id);
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
  Future<NoteModel> readNote(String noteId) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final note = await FirebaseFirestore.instance
        .collection('userNotes')
        .doc(currentUser.uid)
        .collection('notes')
        .doc(noteId)
        .get();
    final response = NoteModel.fromJson(note.data()!);
    debugPrint(response.createdOn.toString());
    return response;
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
