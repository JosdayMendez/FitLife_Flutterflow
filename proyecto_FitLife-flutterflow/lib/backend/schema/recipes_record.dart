import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  bool hasCalories() => _calories != null;

  // "Proteins" field.
  int? _proteins;
  int get proteins => _proteins ?? 0;
  bool hasProteins() => _proteins != null;

  // "Fats" field.
  int? _fats;
  int get fats => _fats ?? 0;
  bool hasFats() => _fats != null;

  // "Portion" field.
  int? _portion;
  int get portion => _portion ?? 0;
  bool hasPortion() => _portion != null;

  // "PreparationTime" field.
  String? _preparationTime;
  String get preparationTime => _preparationTime ?? '';
  bool hasPreparationTime() => _preparationTime != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _calories = castToType<int>(snapshotData['Calories']);
    _proteins = castToType<int>(snapshotData['Proteins']);
    _fats = castToType<int>(snapshotData['Fats']);
    _portion = castToType<int>(snapshotData['Portion']);
    _preparationTime = snapshotData['PreparationTime'] as String?;
    _image = snapshotData['Image'] as String?;
    _ingredients = snapshotData['Ingredients'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  int? calories,
  int? proteins,
  int? fats,
  int? portion,
  String? preparationTime,
  String? image,
  String? ingredients,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Calories': calories,
      'Proteins': proteins,
      'Fats': fats,
      'Portion': portion,
      'PreparationTime': preparationTime,
      'Image': image,
      'Ingredients': ingredients,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.calories == e2?.calories &&
        e1?.proteins == e2?.proteins &&
        e1?.fats == e2?.fats &&
        e1?.portion == e2?.portion &&
        e1?.preparationTime == e2?.preparationTime &&
        e1?.image == e2?.image &&
        e1?.ingredients == e2?.ingredients;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.calories,
        e?.proteins,
        e?.fats,
        e?.portion,
        e?.preparationTime,
        e?.image,
        e?.ingredients
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
