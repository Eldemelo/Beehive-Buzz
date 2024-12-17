import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "comment_likes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "comment_city" field.
  String? _commentCity;
  String get commentCity => _commentCity ?? '';
  bool hasCommentCity() => _commentCity != null;

  // "comment_state" field.
  String? _commentState;
  String get commentState => _commentState ?? '';
  bool hasCommentState() => _commentState != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _body = snapshotData['body'] as String?;
    _commentUser = snapshotData['comment_user'] as DocumentReference?;
    _commentLikes = getDataList(snapshotData['comment_likes']);
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _commentCity = snapshotData['comment_city'] as String?;
    _commentState = snapshotData['comment_state'] as String?;
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
  String? body,
  DocumentReference? commentUser,
  DateTime? commentTime,
  String? commentCity,
  String? commentState,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'body': body,
      'comment_user': commentUser,
      'comment_time': commentTime,
      'comment_city': commentCity,
      'comment_state': commentState,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.body == e2?.body &&
        e1?.commentUser == e2?.commentUser &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes) &&
        e1?.commentTime == e2?.commentTime &&
        e1?.commentCity == e2?.commentCity &&
        e1?.commentState == e2?.commentState;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.body,
        e?.commentUser,
        e?.commentLikes,
        e?.commentTime,
        e?.commentCity,
        e?.commentState
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
