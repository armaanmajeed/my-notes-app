import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotesapp/services/cloud/cloud_notes.dart';
import 'package:mynotesapp/services/cloud/cloud_storage_constants.dart';
import 'package:mynotesapp/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  final notes = FirebaseFirestore.instance.collection('notes');

  Future<void> deleteNotes({required String documentId}) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw ClouldNotDeleteNotesException();
    }
  }

  Future<void> updateNotes({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw ClouldNotUpdateNotesException();
    }
  }

  Stream<Iterable<CloudNotes>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map((event) => event.docs
          .map((doc) => CloudNotes.fromSnapshot(doc))
          .where((note) => note.ownerUserId == ownerUserId));

  Future<Iterable<CloudNotes>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(ownerUserId, isEqualTo: ownerUserId)
          .get()
          .then((value) => value.docs.map((doc) => CloudNotes(
                documentId: doc.id,
                ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                text: doc.data()[textFieldName] as String,
              )));
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  void createNewNotes({required String ownerUserId}) async {
    try {
      await notes.add({
        ownerUserIdFieldName: ownerUserId,
        textFieldName: '',
      });
    } catch (e) {
      throw CouldNotCreateNotesException();
    }
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInsatnce();
  FirebaseCloudStorage._sharedInsatnce();
  factory FirebaseCloudStorage() => _shared;
}
