import '/flutter_flow/flutter_flow_util.dart';
import 'add_recipe_widget.dart' show AddRecipeWidget;
import 'package:flutter/material.dart';

class AddRecipeModel extends FlutterFlowModel<AddRecipeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameTextController;
  String? Function(BuildContext, String?)? txtNameTextControllerValidator;
  String? _txtNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for caloriesTxt widget.
  FocusNode? caloriesTxtFocusNode;
  TextEditingController? caloriesTxtTextController;
  String? Function(BuildContext, String?)? caloriesTxtTextControllerValidator;
  String? _caloriesTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for proteinTxt widget.
  FocusNode? proteinTxtFocusNode;
  TextEditingController? proteinTxtTextController;
  String? Function(BuildContext, String?)? proteinTxtTextControllerValidator;
  String? _proteinTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for fatsTxt widget.
  FocusNode? fatsTxtFocusNode;
  TextEditingController? fatsTxtTextController;
  String? Function(BuildContext, String?)? fatsTxtTextControllerValidator;
  String? _fatsTxtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for portionTxt widget.
  FocusNode? portionTxtFocusNode;
  TextEditingController? portionTxtTextController;
  String? Function(BuildContext, String?)? portionTxtTextControllerValidator;
  String? _portionTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for preparationTxt widget.
  FocusNode? preparationTxtFocusNode;
  TextEditingController? preparationTxtTextController;
  String? Function(BuildContext, String?)?
      preparationTxtTextControllerValidator;
  String? _preparationTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ingredientsTxt widget.
  FocusNode? ingredientsTxtFocusNode;
  TextEditingController? ingredientsTxtTextController;
  String? Function(BuildContext, String?)?
      ingredientsTxtTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    txtNameTextControllerValidator = _txtNameTextControllerValidator;
    caloriesTxtTextControllerValidator = _caloriesTxtTextControllerValidator;
    proteinTxtTextControllerValidator = _proteinTxtTextControllerValidator;
    fatsTxtTextControllerValidator = _fatsTxtTextControllerValidator;
    portionTxtTextControllerValidator = _portionTxtTextControllerValidator;
    preparationTxtTextControllerValidator =
        _preparationTxtTextControllerValidator;
  }

  @override
  void dispose() {
    txtNameFocusNode?.dispose();
    txtNameTextController?.dispose();

    caloriesTxtFocusNode?.dispose();
    caloriesTxtTextController?.dispose();

    proteinTxtFocusNode?.dispose();
    proteinTxtTextController?.dispose();

    fatsTxtFocusNode?.dispose();
    fatsTxtTextController?.dispose();

    portionTxtFocusNode?.dispose();
    portionTxtTextController?.dispose();

    preparationTxtFocusNode?.dispose();
    preparationTxtTextController?.dispose();

    ingredientsTxtFocusNode?.dispose();
    ingredientsTxtTextController?.dispose();
  }
}
