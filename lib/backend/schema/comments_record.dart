import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? comment,
  DocumentReference? user,
  DateTime? date,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'user': user,
      'date': date,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.user == e2?.user &&
        e1?.date == e2?.date &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(CommentsRecord? e) =>
      const ListEquality().hash([e?.comment, e?.user, e?.date, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
