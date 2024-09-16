import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RoleRecord extends FirestoreRecord {
  RoleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Role_name" field.
  String? _roleName;
  String get roleName => _roleName ?? '';
  bool hasRoleName() => _roleName != null;

  void _initializeFields() {
    _roleName = snapshotData['Role_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('role');

  static Stream<RoleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoleRecord.fromSnapshot(s));

  static Future<RoleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoleRecord.fromSnapshot(s));

  static RoleRecord fromSnapshot(DocumentSnapshot snapshot) => RoleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoleRecordData({
  String? roleName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Role_name': roleName,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoleRecordDocumentEquality implements Equality<RoleRecord> {
  const RoleRecordDocumentEquality();

  @override
  bool equals(RoleRecord? e1, RoleRecord? e2) {
    return e1?.roleName == e2?.roleName;
  }

  @override
  int hash(RoleRecord? e) => const ListEquality().hash([e?.roleName]);

  @override
  bool isValidKey(Object? o) => o is RoleRecord;
}
