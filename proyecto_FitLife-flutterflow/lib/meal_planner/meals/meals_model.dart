import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meals_widget.dart' show MealsWidget;
import 'package:flutter/material.dart';

class MealsModel extends FlutterFlowModel<MealsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtSearchMeal widget.
  FocusNode? txtSearchMealFocusNode;
  TextEditingController? txtSearchMealTextController;
  String? Function(BuildContext, String?)? txtSearchMealTextControllerValidator;
  List<MealsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtSearchMealFocusNode?.dispose();
    txtSearchMealTextController?.dispose();
  }
}
