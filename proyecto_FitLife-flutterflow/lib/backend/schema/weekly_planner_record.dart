import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class WeeklyPlannerRecord extends FirestoreRecord {
  WeeklyPlannerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nameDay" field.
  String? _nameDay;
  String get nameDay => _nameDay ?? '';
  bool hasNameDay() => _nameDay != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "breakfastMealName" field.
  String? _breakfastMealName;
  String get breakfastMealName => _breakfastMealName ?? '';
  bool hasBreakfastMealName() => _breakfastMealName != null;

  // "breakfastMealtime" field.
  DateTime? _breakfastMealtime;
  DateTime? get breakfastMealtime => _breakfastMealtime;
  bool hasBreakfastMealtime() => _breakfastMealtime != null;

  // "breakfastMealReference" field.
  DocumentReference? _breakfastMealReference;
  DocumentReference? get breakfastMealReference => _breakfastMealReference;
  bool hasBreakfastMealReference() => _breakfastMealReference != null;

  // "lunchMealName" field.
  String? _lunchMealName;
  String get lunchMealName => _lunchMealName ?? '';
  bool hasLunchMealName() => _lunchMealName != null;

  // "lunchMealTime" field.
  DateTime? _lunchMealTime;
  DateTime? get lunchMealTime => _lunchMealTime;
  bool hasLunchMealTime() => _lunchMealTime != null;

  // "lunchMealReference" field.
  DocumentReference? _lunchMealReference;
  DocumentReference? get lunchMealReference => _lunchMealReference;
  bool hasLunchMealReference() => _lunchMealReference != null;

  // "snackMealName" field.
  String? _snackMealName;
  String get snackMealName => _snackMealName ?? '';
  bool hasSnackMealName() => _snackMealName != null;

  // "snackMealTime" field.
  DateTime? _snackMealTime;
  DateTime? get snackMealTime => _snackMealTime;
  bool hasSnackMealTime() => _snackMealTime != null;

  // "snackMealReference" field.
  DocumentReference? _snackMealReference;
  DocumentReference? get snackMealReference => _snackMealReference;
  bool hasSnackMealReference() => _snackMealReference != null;

  // "dinnerMealName" field.
  String? _dinnerMealName;
  String get dinnerMealName => _dinnerMealName ?? '';
  bool hasDinnerMealName() => _dinnerMealName != null;

  // "dinnerMealTime" field.
  DateTime? _dinnerMealTime;
  DateTime? get dinnerMealTime => _dinnerMealTime;
  bool hasDinnerMealTime() => _dinnerMealTime != null;

  // "dinnerMealReference" field.
  DocumentReference? _dinnerMealReference;
  DocumentReference? get dinnerMealReference => _dinnerMealReference;
  bool hasDinnerMealReference() => _dinnerMealReference != null;

  void _initializeFields() {
    _nameDay = snapshotData['nameDay'] as String?;
    _userId = snapshotData['userId'] as String?;
    _breakfastMealName = snapshotData['breakfastMealName'] as String?;
    _breakfastMealtime = snapshotData['breakfastMealtime'] as DateTime?;
    _breakfastMealReference =
        snapshotData['breakfastMealReference'] as DocumentReference?;
    _lunchMealName = snapshotData['lunchMealName'] as String?;
    _lunchMealTime = snapshotData['lunchMealTime'] as DateTime?;
    _lunchMealReference =
        snapshotData['lunchMealReference'] as DocumentReference?;
    _snackMealName = snapshotData['snackMealName'] as String?;
    _snackMealTime = snapshotData['snackMealTime'] as DateTime?;
    _snackMealReference =
        snapshotData['snackMealReference'] as DocumentReference?;
    _dinnerMealName = snapshotData['dinnerMealName'] as String?;
    _dinnerMealTime = snapshotData['dinnerMealTime'] as DateTime?;
    _dinnerMealReference =
        snapshotData['dinnerMealReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weeklyPlanner');

  static Stream<WeeklyPlannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeeklyPlannerRecord.fromSnapshot(s));

  static Future<WeeklyPlannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeeklyPlannerRecord.fromSnapshot(s));

  static WeeklyPlannerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeeklyPlannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeeklyPlannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeeklyPlannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeeklyPlannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeeklyPlannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeeklyPlannerRecordData({
  String? nameDay,
  String? userId,
  String? breakfastMealName,
  DateTime? breakfastMealtime,
  DocumentReference? breakfastMealReference,
  String? lunchMealName,
  DateTime? lunchMealTime,
  DocumentReference? lunchMealReference,
  String? snackMealName,
  DateTime? snackMealTime,
  DocumentReference? snackMealReference,
  String? dinnerMealName,
  DateTime? dinnerMealTime,
  DocumentReference? dinnerMealReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameDay': nameDay,
      'userId': userId,
      'breakfastMealName': breakfastMealName,
      'breakfastMealtime': breakfastMealtime,
      'breakfastMealReference': breakfastMealReference,
      'lunchMealName': lunchMealName,
      'lunchMealTime': lunchMealTime,
      'lunchMealReference': lunchMealReference,
      'snackMealName': snackMealName,
      'snackMealTime': snackMealTime,
      'snackMealReference': snackMealReference,
      'dinnerMealName': dinnerMealName,
      'dinnerMealTime': dinnerMealTime,
      'dinnerMealReference': dinnerMealReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeeklyPlannerRecordDocumentEquality
    implements Equality<WeeklyPlannerRecord> {
  const WeeklyPlannerRecordDocumentEquality();

  @override
  bool equals(WeeklyPlannerRecord? e1, WeeklyPlannerRecord? e2) {
    return e1?.nameDay == e2?.nameDay &&
        e1?.userId == e2?.userId &&
        e1?.breakfastMealName == e2?.breakfastMealName &&
        e1?.breakfastMealtime == e2?.breakfastMealtime &&
        e1?.breakfastMealReference == e2?.breakfastMealReference &&
        e1?.lunchMealName == e2?.lunchMealName &&
        e1?.lunchMealTime == e2?.lunchMealTime &&
        e1?.lunchMealReference == e2?.lunchMealReference &&
        e1?.snackMealName == e2?.snackMealName &&
        e1?.snackMealTime == e2?.snackMealTime &&
        e1?.snackMealReference == e2?.snackMealReference &&
        e1?.dinnerMealName == e2?.dinnerMealName &&
        e1?.dinnerMealTime == e2?.dinnerMealTime &&
        e1?.dinnerMealReference == e2?.dinnerMealReference;
  }

  @override
  int hash(WeeklyPlannerRecord? e) => const ListEquality().hash([
        e?.nameDay,
        e?.userId,
        e?.breakfastMealName,
        e?.breakfastMealtime,
        e?.breakfastMealReference,
        e?.lunchMealName,
        e?.lunchMealTime,
        e?.lunchMealReference,
        e?.snackMealName,
        e?.snackMealTime,
        e?.snackMealReference,
        e?.dinnerMealName,
        e?.dinnerMealTime,
        e?.dinnerMealReference
      ]);

  @override
  bool isValidKey(Object? o) => o is WeeklyPlannerRecord;
}
