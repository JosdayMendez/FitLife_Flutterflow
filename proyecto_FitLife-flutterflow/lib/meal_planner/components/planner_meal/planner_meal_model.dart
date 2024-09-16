import '/flutter_flow/flutter_flow_util.dart';
import 'planner_meal_widget.dart' show PlannerMealWidget;
import 'package:flutter/material.dart';

class PlannerMealModel extends FlutterFlowModel<PlannerMealWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtMealName widget.
  FocusNode? txtMealNameFocusNode;
  TextEditingController? txtMealNameTextController;
  String? Function(BuildContext, String?)? txtMealNameTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtMealNameFocusNode?.dispose();
    txtMealNameTextController?.dispose();
  }
}
