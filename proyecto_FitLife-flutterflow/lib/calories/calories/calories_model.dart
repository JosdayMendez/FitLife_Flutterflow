import '/flutter_flow/flutter_flow_util.dart';
import 'calories_widget.dart' show CaloriesWidget;
import 'package:flutter/material.dart';

class CaloriesModel extends FlutterFlowModel<CaloriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
