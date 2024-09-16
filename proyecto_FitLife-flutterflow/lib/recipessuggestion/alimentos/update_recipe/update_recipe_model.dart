import '/flutter_flow/flutter_flow_util.dart';
import 'update_recipe_widget.dart' show UpdateRecipeWidget;
import 'package:flutter/material.dart';

class UpdateRecipeModel extends FlutterFlowModel<UpdateRecipeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RecipeName widget.
  FocusNode? recipeNameFocusNode;
  TextEditingController? recipeNameTextController;
  String? Function(BuildContext, String?)? recipeNameTextControllerValidator;
  // State field(s) for preparationTime widget.
  FocusNode? preparationTimeFocusNode;
  TextEditingController? preparationTimeTextController;
  String? Function(BuildContext, String?)?
      preparationTimeTextControllerValidator;
  // State field(s) for portionsTxt widget.
  FocusNode? portionsTxtFocusNode;
  TextEditingController? portionsTxtTextController;
  String? Function(BuildContext, String?)? portionsTxtTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for caloriesTxt widget.
  FocusNode? caloriesTxtFocusNode;
  TextEditingController? caloriesTxtTextController;
  String? Function(BuildContext, String?)? caloriesTxtTextControllerValidator;
  // State field(s) for proteinsTxt widget.
  FocusNode? proteinsTxtFocusNode;
  TextEditingController? proteinsTxtTextController;
  String? Function(BuildContext, String?)? proteinsTxtTextControllerValidator;
  // State field(s) for fatsTxt widget.
  FocusNode? fatsTxtFocusNode;
  TextEditingController? fatsTxtTextController;
  String? Function(BuildContext, String?)? fatsTxtTextControllerValidator;
  // State field(s) for ingredientsTxt widget.
  FocusNode? ingredientsTxtFocusNode;
  TextEditingController? ingredientsTxtTextController;
  String? Function(BuildContext, String?)?
      ingredientsTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    recipeNameFocusNode?.dispose();
    recipeNameTextController?.dispose();

    preparationTimeFocusNode?.dispose();
    preparationTimeTextController?.dispose();

    portionsTxtFocusNode?.dispose();
    portionsTxtTextController?.dispose();

    caloriesTxtFocusNode?.dispose();
    caloriesTxtTextController?.dispose();

    proteinsTxtFocusNode?.dispose();
    proteinsTxtTextController?.dispose();

    fatsTxtFocusNode?.dispose();
    fatsTxtTextController?.dispose();

    ingredientsTxtFocusNode?.dispose();
    ingredientsTxtTextController?.dispose();
  }
}
