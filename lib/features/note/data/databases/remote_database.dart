import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
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
            return NoteModel.fromJson(e.data()).copyWith(id: e.id);
          }).toList(),
        );

    // debugPrint(notesPath.docs[0].data()['notes'].toString());
    // final documentRef = (notesPath.docs[0].data()['notes'] as DocumentReference).path;
    // final notes = await FirebaseFirestore.instance.doc(documentRef).get();

    // debugPrint(notes.data().toString());

    // .snapshots()
    // .map(
    //   (event) => event.docs.map(
    //     (e) {
    //       return (e['notes'] as List)
    //           .map((json) => NoteModel.fromJson(json.data()['notes']))
    //           .toList();
    //     },
    //   ).toList()[0],
    // );
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

    debugPrint('updated notes${noteModel.content}');
    await docRef.update({'content': noteModel.content});
    debugPrint('updated notes${noteModel.id}');
  }
}
