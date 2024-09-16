import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupplementsSugestRecord extends FirestoreRecord {
  SupplementsSugestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "average_flavor_rating" field.
  double? _averageFlavorRating;
  double get averageFlavorRating => _averageFlavorRating ?? 0.0;
  bool hasAverageFlavorRating() => _averageFlavorRating != null;

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "number_of_flavors" field.
  String? _numberOfFlavors;
  String get numberOfFlavors => _numberOfFlavors ?? '';
  bool hasNumberOfFlavors() => _numberOfFlavors != null;

  // "number_of_reviews" field.
  int? _numberOfReviews;
  int get numberOfReviews => _numberOfReviews ?? 0;
  bool hasNumberOfReviews() => _numberOfReviews != null;

  // "overall_rating" field.
  double? _overallRating;
  double get overallRating => _overallRating ?? 0.0;
  bool hasOverallRating() => _overallRating != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "price_per_serving" field.
  double? _pricePerServing;
  double get pricePerServing => _pricePerServing ?? 0.0;
  bool hasPricePerServing() => _pricePerServing != null;

  // "product_category" field.
  String? _productCategory;
  String get productCategory => _productCategory ?? '';
  bool hasProductCategory() => _productCategory != null;

  // "product_description" field.
  String? _productDescription;
  String get productDescription => _productDescription ?? '';
  bool hasProductDescription() => _productDescription != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "top_flavor_rated" field.
  String? _topFlavorRated;
  String get topFlavorRated => _topFlavorRated ?? '';
  bool hasTopFlavorRated() => _topFlavorRated != null;

  // "verified_buyer_number" field.
  String? _verifiedBuyerNumber;
  String get verifiedBuyerNumber => _verifiedBuyerNumber ?? '';
  bool hasVerifiedBuyerNumber() => _verifiedBuyerNumber != null;

  // "verified_buyer_rating" field.
  String? _verifiedBuyerRating;
  String get verifiedBuyerRating => _verifiedBuyerRating ?? '';
  bool hasVerifiedBuyerRating() => _verifiedBuyerRating != null;

  void _initializeFields() {
    _averageFlavorRating =
        castToType<double>(snapshotData['average_flavor_rating']);
    _brandName = snapshotData['brand_name'] as String?;
    _link = snapshotData['link'] as String?;
    _numberOfFlavors = snapshotData['number_of_flavors'] as String?;
    _numberOfReviews = castToType<int>(snapshotData['number_of_reviews']);
    _overallRating = castToType<double>(snapshotData['overall_rating']);
    _price = castToType<double>(snapshotData['price']);
    _pricePerServing = castToType<double>(snapshotData['price_per_serving']);
    _productCategory = snapshotData['product_category'] as String?;
    _productDescription = snapshotData['product_description'] as String?;
    _productName = snapshotData['product_name'] as String?;
    _topFlavorRated = snapshotData['top_flavor_rated'] as String?;
    _verifiedBuyerNumber = snapshotData['verified_buyer_number'] as String?;
    _verifiedBuyerRating = snapshotData['verified_buyer_rating'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SupplementsSugest');

  static Stream<SupplementsSugestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupplementsSugestRecord.fromSnapshot(s));

  static Future<SupplementsSugestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SupplementsSugestRecord.fromSnapshot(s));

  static SupplementsSugestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupplementsSugestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupplementsSugestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupplementsSugestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupplementsSugestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupplementsSugestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupplementsSugestRecordData({
  double? averageFlavorRating,
  String? brandName,
  String? link,
  String? numberOfFlavors,
  int? numberOfReviews,
  double? overallRating,
  double? price,
  double? pricePerServing,
  String? productCategory,
  String? productDescription,
  String? productName,
  String? topFlavorRated,
  String? verifiedBuyerNumber,
  String? verifiedBuyerRating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'average_flavor_rating': averageFlavorRating,
      'brand_name': brandName,
      'link': link,
      'number_of_flavors': numberOfFlavors,
      'number_of_reviews': numberOfReviews,
      'overall_rating': overallRating,
      'price': price,
      'price_per_serving': pricePerServing,
      'product_category': productCategory,
      'product_description': productDescription,
      'product_name': productName,
      'top_flavor_rated': topFlavorRated,
      'verified_buyer_number': verifiedBuyerNumber,
      'verified_buyer_rating': verifiedBuyerRating,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupplementsSugestRecordDocumentEquality
    implements Equality<SupplementsSugestRecord> {
  const SupplementsSugestRecordDocumentEquality();

  @override
  bool equals(SupplementsSugestRecord? e1, SupplementsSugestRecord? e2) {
    return e1?.averageFlavorRating == e2?.averageFlavorRating &&
        e1?.brandName == e2?.brandName &&
        e1?.link == e2?.link &&
        e1?.numberOfFlavors == e2?.numberOfFlavors &&
        e1?.numberOfReviews == e2?.numberOfReviews &&
        e1?.overallRating == e2?.overallRating &&
        e1?.price == e2?.price &&
        e1?.pricePerServing == e2?.pricePerServing &&
        e1?.productCategory == e2?.productCategory &&
        e1?.productDescription == e2?.productDescription &&
        e1?.productName == e2?.productName &&
        e1?.topFlavorRated == e2?.topFlavorRated &&
        e1?.verifiedBuyerNumber == e2?.verifiedBuyerNumber &&
        e1?.verifiedBuyerRating == e2?.verifiedBuyerRating;
  }

  @override
  int hash(SupplementsSugestRecord? e) => const ListEquality().hash([
        e?.averageFlavorRating,
        e?.brandName,
        e?.link,
        e?.numberOfFlavors,
        e?.numberOfReviews,
        e?.overallRating,
        e?.price,
        e?.pricePerServing,
        e?.productCategory,
        e?.productDescription,
        e?.productName,
        e?.topFlavorRated,
        e?.verifiedBuyerNumber,
        e?.verifiedBuyerRating
      ]);

  @override
  bool isValidKey(Object? o) => o is SupplementsSugestRecord;
}
