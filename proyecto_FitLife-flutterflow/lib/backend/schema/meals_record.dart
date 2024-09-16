import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "preparation" field.
  String? _preparation;
  String get preparation => _preparation ?? '';
  bool hasPreparation() => _preparation != null;

  // "mealType" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  bool hasMealType() => _mealType != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _preparation = snapshotData['preparation'] as String?;
    _mealType = snapshotData['mealType'] as String?;
    _image = snapshotData['image'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealsRecordData({
  String? name,
  String? preparation,
  String? mealType,
  String? image,
  String? ingredients,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'preparation': preparation,
      'mealType': mealType,
      'image': image,
      'ingredients': ingredients,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealsRecordDocumentEquality implements Equality<MealsRecord> {
  const MealsRecordDocumentEquality();

  @override
  bool equals(MealsRecord? e1, MealsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.preparation == e2?.preparation &&
        e1?.mealType == e2?.mealType &&
        e1?.image == e2?.image &&
        e1?.ingredients == e2?.ingredients &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(MealsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.preparation,
        e?.mealType,
        e?.image,
        e?.ingredients,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is MealsRecord;
}
