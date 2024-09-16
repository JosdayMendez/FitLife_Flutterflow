import '/flutter_flow/flutter_flow_util.dart';
import 'planner_widget.dart' show PlannerWidget;
import 'package:flutter/material.dart';

class PlannerModel extends FlutterFlowModel<PlannerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Planner widget.
  int? planner;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
