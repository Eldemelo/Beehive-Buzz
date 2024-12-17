import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserPostsRecord extends FirestoreRecord {
  UserPostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "post_body" field.
  String? _postBody;
  String get postBody => _postBody ?? '';
  bool hasPostBody() => _postBody != null;

  // "post_time" field.
  DateTime? _postTime;
  DateTime? get postTime => _postTime;
  bool hasPostTime() => _postTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "contains_media" field.
  bool? _containsMedia;
  bool get containsMedia => _containsMedia ?? false;
  bool hasContainsMedia() => _containsMedia != null;

  // "media_url" field.
  String? _mediaUrl;
  String get mediaUrl => _mediaUrl ?? '';
  bool hasMediaUrl() => _mediaUrl != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "postUser" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "display_photo_url" field.
  String? _displayPhotoUrl;
  String get displayPhotoUrl => _displayPhotoUrl ?? '';
  bool hasDisplayPhotoUrl() => _displayPhotoUrl != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "postCoords" field.
  LatLng? _postCoords;
  LatLng? get postCoords => _postCoords;
  bool hasPostCoords() => _postCoords != null;

  // "postCity" field.
  String? _postCity;
  String get postCity => _postCity ?? '';
  bool hasPostCity() => _postCity != null;

  // "postState" field.
  String? _postState;
  String get postState => _postState ?? '';
  bool hasPostState() => _postState != null;

  // "postLat" field.
  double? _postLat;
  double get postLat => _postLat ?? 0.0;
  bool hasPostLat() => _postLat != null;

  // "postLong" field.
  double? _postLong;
  double get postLong => _postLong ?? 0.0;
  bool hasPostLong() => _postLong != null;

  // "userLikes" field.
  List<DocumentReference>? _userLikes;
  List<DocumentReference> get userLikes => _userLikes ?? const [];
  bool hasUserLikes() => _userLikes != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _username = snapshotData['username'] as String?;
    _postBody = snapshotData['post_body'] as String?;
    _postTime = snapshotData['post_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _containsMedia = snapshotData['contains_media'] as bool?;
    _mediaUrl = snapshotData['media_url'] as String?;
    _email = snapshotData['email'] as String?;
    _postUser = snapshotData['postUser'] as DocumentReference?;
    _displayPhotoUrl = snapshotData['display_photo_url'] as String?;
    _comments = getDataList(snapshotData['comments']);
    _postCoords = snapshotData['postCoords'] as LatLng?;
    _postCity = snapshotData['postCity'] as String?;
    _postState = snapshotData['postState'] as String?;
    _postLat = castToType<double>(snapshotData['postLat']);
    _postLong = castToType<double>(snapshotData['postLong']);
    _userLikes = getDataList(snapshotData['userLikes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_posts');

  static Stream<UserPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPostsRecord.fromSnapshot(s));

  static Future<UserPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPostsRecord.fromSnapshot(s));

  static UserPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPostsRecordData({
  String? uid,
  String? displayName,
  String? username,
  String? postBody,
  DateTime? postTime,
  String? photoUrl,
  bool? containsMedia,
  String? mediaUrl,
  String? email,
  DocumentReference? postUser,
  String? displayPhotoUrl,
  LatLng? postCoords,
  String? postCity,
  String? postState,
  double? postLat,
  double? postLong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'display_name': displayName,
      'username': username,
      'post_body': postBody,
      'post_time': postTime,
      'photo_url': photoUrl,
      'contains_media': containsMedia,
      'media_url': mediaUrl,
      'email': email,
      'postUser': postUser,
      'display_photo_url': displayPhotoUrl,
      'postCoords': postCoords,
      'postCity': postCity,
      'postState': postState,
      'postLat': postLat,
      'postLong': postLong,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPostsRecordDocumentEquality implements Equality<UserPostsRecord> {
  const UserPostsRecordDocumentEquality();

  @override
  bool equals(UserPostsRecord? e1, UserPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.username == e2?.username &&
        e1?.postBody == e2?.postBody &&
        e1?.postTime == e2?.postTime &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.containsMedia == e2?.containsMedia &&
        e1?.mediaUrl == e2?.mediaUrl &&
        e1?.email == e2?.email &&
        e1?.postUser == e2?.postUser &&
        e1?.displayPhotoUrl == e2?.displayPhotoUrl &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.postCoords == e2?.postCoords &&
        e1?.postCity == e2?.postCity &&
        e1?.postState == e2?.postState &&
        e1?.postLat == e2?.postLat &&
        e1?.postLong == e2?.postLong &&
        listEquality.equals(e1?.userLikes, e2?.userLikes);
  }

  @override
  int hash(UserPostsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.displayName,
        e?.username,
        e?.postBody,
        e?.postTime,
        e?.photoUrl,
        e?.containsMedia,
        e?.mediaUrl,
        e?.email,
        e?.postUser,
        e?.displayPhotoUrl,
        e?.comments,
        e?.postCoords,
        e?.postCity,
        e?.postState,
        e?.postLat,
        e?.postLong,
        e?.userLikes
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPostsRecord;
}
