import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _Buscar = false;
  bool get Buscar => _Buscar;
  set Buscar(bool value) {
    _Buscar = value;
  }

  bool _searhMeal = false;
  bool get searhMeal => _searhMeal;
  set searhMeal(bool value) {
    _searhMeal = value;
  }

  bool _plannerExisting = false;
  bool get plannerExisting => _plannerExisting;
  set plannerExisting(bool value) {
    _plannerExisting = value;
  }
}
