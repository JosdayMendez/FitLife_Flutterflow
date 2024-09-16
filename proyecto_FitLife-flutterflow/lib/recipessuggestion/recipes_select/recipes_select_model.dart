import '/flutter_flow/flutter_flow_util.dart';
import 'recipes_select_widget.dart' show RecipesSelectWidget;
import 'package:flutter/material.dart';

class RecipesSelectModel extends FlutterFlowModel<RecipesSelectWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
