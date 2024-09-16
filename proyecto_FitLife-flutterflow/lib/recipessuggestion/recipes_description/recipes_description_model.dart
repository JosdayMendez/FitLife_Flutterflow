import '/flutter_flow/flutter_flow_util.dart';
import 'recipes_description_widget.dart' show RecipesDescriptionWidget;
import 'package:flutter/material.dart';

class RecipesDescriptionModel
    extends FlutterFlowModel<RecipesDescriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
