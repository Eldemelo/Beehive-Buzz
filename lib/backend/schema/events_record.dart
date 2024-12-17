import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
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

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "event_time" field.
  DateTime? _eventTime;
  DateTime? get eventTime => _eventTime;
  bool hasEventTime() => _eventTime != null;

  // "eventUser" field.
  DocumentReference? _eventUser;
  DocumentReference? get eventUser => _eventUser;
  bool hasEventUser() => _eventUser != null;

  // "displayPhotoURL" field.
  String? _displayPhotoURL;
  String get displayPhotoURL => _displayPhotoURL ?? '';
  bool hasDisplayPhotoURL() => _displayPhotoURL != null;

  // "num_interested" field.
  int? _numInterested;
  int get numInterested => _numInterested ?? 0;
  bool hasNumInterested() => _numInterested != null;

  // "event_street" field.
  String? _eventStreet;
  String get eventStreet => _eventStreet ?? '';
  bool hasEventStreet() => _eventStreet != null;

  // "event_town" field.
  String? _eventTown;
  String get eventTown => _eventTown ?? '';
  bool hasEventTown() => _eventTown != null;

  // "event_state" field.
  String? _eventState;
  String get eventState => _eventState ?? '';
  bool hasEventState() => _eventState != null;

  // "event_country" field.
  String? _eventCountry;
  String get eventCountry => _eventCountry ?? '';
  bool hasEventCountry() => _eventCountry != null;

  // "event_postalcode" field.
  String? _eventPostalcode;
  String get eventPostalcode => _eventPostalcode ?? '';
  bool hasEventPostalcode() => _eventPostalcode != null;

  // "event_lat" field.
  String? _eventLat;
  String get eventLat => _eventLat ?? '';
  bool hasEventLat() => _eventLat != null;

  // "event_long" field.
  String? _eventLong;
  String get eventLong => _eventLong ?? '';
  bool hasEventLong() => _eventLong != null;

  // "interestedUsers" field.
  List<DocumentReference>? _interestedUsers;
  List<DocumentReference> get interestedUsers => _interestedUsers ?? const [];
  bool hasInterestedUsers() => _interestedUsers != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _username = snapshotData['username'] as String?;
    _eventName = snapshotData['event_name'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _eventLocation = snapshotData['event_location'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _eventTime = snapshotData['event_time'] as DateTime?;
    _eventUser = snapshotData['eventUser'] as DocumentReference?;
    _displayPhotoURL = snapshotData['displayPhotoURL'] as String?;
    _numInterested = castToType<int>(snapshotData['num_interested']);
    _eventStreet = snapshotData['event_street'] as String?;
    _eventTown = snapshotData['event_town'] as String?;
    _eventState = snapshotData['event_state'] as String?;
    _eventCountry = snapshotData['event_country'] as String?;
    _eventPostalcode = snapshotData['event_postalcode'] as String?;
    _eventLat = snapshotData['event_lat'] as String?;
    _eventLong = snapshotData['event_long'] as String?;
    _interestedUsers = getDataList(snapshotData['interestedUsers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? uid,
  String? displayName,
  String? username,
  String? eventName,
  String? eventDescription,
  String? eventLocation,
  DateTime? createdTime,
  DateTime? eventTime,
  DocumentReference? eventUser,
  String? displayPhotoURL,
  int? numInterested,
  String? eventStreet,
  String? eventTown,
  String? eventState,
  String? eventCountry,
  String? eventPostalcode,
  String? eventLat,
  String? eventLong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'display_name': displayName,
      'username': username,
      'event_name': eventName,
      'event_description': eventDescription,
      'event_location': eventLocation,
      'created_time': createdTime,
      'event_time': eventTime,
      'eventUser': eventUser,
      'displayPhotoURL': displayPhotoURL,
      'num_interested': numInterested,
      'event_street': eventStreet,
      'event_town': eventTown,
      'event_state': eventState,
      'event_country': eventCountry,
      'event_postalcode': eventPostalcode,
      'event_lat': eventLat,
      'event_long': eventLong,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.username == e2?.username &&
        e1?.eventName == e2?.eventName &&
        e1?.eventDescription == e2?.eventDescription &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.createdTime == e2?.createdTime &&
        e1?.eventTime == e2?.eventTime &&
        e1?.eventUser == e2?.eventUser &&
        e1?.displayPhotoURL == e2?.displayPhotoURL &&
        e1?.numInterested == e2?.numInterested &&
        e1?.eventStreet == e2?.eventStreet &&
        e1?.eventTown == e2?.eventTown &&
        e1?.eventState == e2?.eventState &&
        e1?.eventCountry == e2?.eventCountry &&
        e1?.eventPostalcode == e2?.eventPostalcode &&
        e1?.eventLat == e2?.eventLat &&
        e1?.eventLong == e2?.eventLong &&
        listEquality.equals(e1?.interestedUsers, e2?.interestedUsers);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.displayName,
        e?.username,
        e?.eventName,
        e?.eventDescription,
        e?.eventLocation,
        e?.createdTime,
        e?.eventTime,
        e?.eventUser,
        e?.displayPhotoURL,
        e?.numInterested,
        e?.eventStreet,
        e?.eventTown,
        e?.eventState,
        e?.eventCountry,
        e?.eventPostalcode,
        e?.eventLat,
        e?.eventLong,
        e?.interestedUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
