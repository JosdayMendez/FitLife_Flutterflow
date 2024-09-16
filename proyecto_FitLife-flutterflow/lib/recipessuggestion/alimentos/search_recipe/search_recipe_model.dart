import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_recipe_widget.dart' show SearchRecipeWidget;
import 'package:flutter/material.dart';

class SearchRecipeModel extends FlutterFlowModel<SearchRecipeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<RecipesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
