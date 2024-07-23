import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotesapp/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

@immutable
class CloudNotes {
  final String documentId;
  final String ownerUserId;
  final String text;

  const CloudNotes({
    required this.documentId,
    required this.ownerUserId,
    required this.text,
  });

  CloudNotes.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName] as String,
        text = snapshot.data()[textFieldName] as String;
}
