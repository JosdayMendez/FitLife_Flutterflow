import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CaloriesRecord extends FirestoreRecord {
  CaloriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "annotation" field.
  String? _annotation;
  String get annotation => _annotation ?? '';
  bool hasAnnotation() => _annotation != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _annotation = snapshotData['annotation'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Calories');

  static Stream<CaloriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CaloriesRecord.fromSnapshot(s));

  static Future<CaloriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CaloriesRecord.fromSnapshot(s));

  static CaloriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CaloriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CaloriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CaloriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CaloriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CaloriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCaloriesRecordData({
  String? annotation,
  double? amount,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'annotation': annotation,
      'amount': amount,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class CaloriesRecordDocumentEquality implements Equality<CaloriesRecord> {
  const CaloriesRecordDocumentEquality();

  @override
  bool equals(CaloriesRecord? e1, CaloriesRecord? e2) {
    return e1?.annotation == e2?.annotation &&
        e1?.amount == e2?.amount &&
        e1?.users == e2?.users;
  }

  @override
  int hash(CaloriesRecord? e) =>
      const ListEquality().hash([e?.annotation, e?.amount, e?.users]);

  @override
  bool isValidKey(Object? o) => o is CaloriesRecord;
}
