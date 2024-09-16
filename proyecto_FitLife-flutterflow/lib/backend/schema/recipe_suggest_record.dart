import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeSuggestRecord extends FirestoreRecord {
  RecipeSuggestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "recipe_name" field.
  String? _recipeName;
  String get recipeName => _recipeName ?? '';
  bool hasRecipeName() => _recipeName != null;

  // "prep_time" field.
  String? _prepTime;
  String get prepTime => _prepTime ?? '';
  bool hasPrepTime() => _prepTime != null;

  // "cook_time" field.
  String? _cookTime;
  String get cookTime => _cookTime ?? '';
  bool hasCookTime() => _cookTime != null;

  // "total_time" field.
  String? _totalTime;
  String get totalTime => _totalTime ?? '';
  bool hasTotalTime() => _totalTime != null;

  // "servings" field.
  int? _servings;
  int get servings => _servings ?? 0;
  bool hasServings() => _servings != null;

  // "yield" field.
  String? _yield;
  String get yield => _yield ?? '';
  bool hasYield() => _yield != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "directions" field.
  String? _directions;
  String get directions => _directions ?? '';
  bool hasDirections() => _directions != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "cuisine_path" field.
  String? _cuisinePath;
  String get cuisinePath => _cuisinePath ?? '';
  bool hasCuisinePath() => _cuisinePath != null;

  // "nutrition" field.
  String? _nutrition;
  String get nutrition => _nutrition ?? '';
  bool hasNutrition() => _nutrition != null;

  // "timing" field.
  String? _timing;
  String get timing => _timing ?? '';
  bool hasTiming() => _timing != null;

  // "img_src" field.
  String? _imgSrc;
  String get imgSrc => _imgSrc ?? '';
  bool hasImgSrc() => _imgSrc != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _recipeName = snapshotData['recipe_name'] as String?;
    _prepTime = snapshotData['prep_time'] as String?;
    _cookTime = snapshotData['cook_time'] as String?;
    _totalTime = snapshotData['total_time'] as String?;
    _servings = castToType<int>(snapshotData['servings']);
    _yield = snapshotData['yield'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _directions = snapshotData['directions'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _url = snapshotData['url'] as String?;
    _cuisinePath = snapshotData['cuisine_path'] as String?;
    _nutrition = snapshotData['nutrition'] as String?;
    _timing = snapshotData['timing'] as String?;
    _imgSrc = snapshotData['img_src'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RecipeSuggest');

  static Stream<RecipeSuggestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipeSuggestRecord.fromSnapshot(s));

  static Future<RecipeSuggestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipeSuggestRecord.fromSnapshot(s));

  static RecipeSuggestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipeSuggestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipeSuggestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipeSuggestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipeSuggestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipeSuggestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipeSuggestRecordData({
  int? id,
  String? recipeName,
  String? prepTime,
  String? cookTime,
  String? totalTime,
  int? servings,
  String? yield,
  String? ingredients,
  String? directions,
  double? rating,
  String? url,
  String? cuisinePath,
  String? nutrition,
  String? timing,
  String? imgSrc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'recipe_name': recipeName,
      'prep_time': prepTime,
      'cook_time': cookTime,
      'total_time': totalTime,
      'servings': servings,
      'yield': yield,
      'ingredients': ingredients,
      'directions': directions,
      'rating': rating,
      'url': url,
      'cuisine_path': cuisinePath,
      'nutrition': nutrition,
      'timing': timing,
      'img_src': imgSrc,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipeSuggestRecordDocumentEquality
    implements Equality<RecipeSuggestRecord> {
  const RecipeSuggestRecordDocumentEquality();

  @override
  bool equals(RecipeSuggestRecord? e1, RecipeSuggestRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.recipeName == e2?.recipeName &&
        e1?.prepTime == e2?.prepTime &&
        e1?.cookTime == e2?.cookTime &&
        e1?.totalTime == e2?.totalTime &&
        e1?.servings == e2?.servings &&
        e1?.yield == e2?.yield &&
        e1?.ingredients == e2?.ingredients &&
        e1?.directions == e2?.directions &&
        e1?.rating == e2?.rating &&
        e1?.url == e2?.url &&
        e1?.cuisinePath == e2?.cuisinePath &&
        e1?.nutrition == e2?.nutrition &&
        e1?.timing == e2?.timing &&
        e1?.imgSrc == e2?.imgSrc;
  }

  @override
  int hash(RecipeSuggestRecord? e) => const ListEquality().hash([
        e?.id,
        e?.recipeName,
        e?.prepTime,
        e?.cookTime,
        e?.totalTime,
        e?.servings,
        e?.yield,
        e?.ingredients,
        e?.directions,
        e?.rating,
        e?.url,
        e?.cuisinePath,
        e?.nutrition,
        e?.timing,
        e?.imgSrc
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipeSuggestRecord;
}
