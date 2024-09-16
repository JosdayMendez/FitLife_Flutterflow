import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_meal_widget.dart' show AddMealWidget;
import 'package:flutter/material.dart';

class AddMealModel extends FlutterFlowModel<AddMealWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtMealName widget.
  FocusNode? txtMealNameFocusNode;
  TextEditingController? txtMealNameTextController;
  String? Function(BuildContext, String?)? txtMealNameTextControllerValidator;
  // State field(s) for txtIngredients widget.
  FocusNode? txtIngredientsFocusNode;
  TextEditingController? txtIngredientsTextController;
  String? Function(BuildContext, String?)?
      txtIngredientsTextControllerValidator;
  // State field(s) for txtPreparation widget.
  FocusNode? txtPreparationFocusNode;
  TextEditingController? txtPreparationTextController;
  String? Function(BuildContext, String?)?
      txtPreparationTextControllerValidator;
  // State field(s) for ddMealType widget.
  String? ddMealTypeValue;
  FormFieldController<String>? ddMealTypeValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtMealNameFocusNode?.dispose();
    txtMealNameTextController?.dispose();

    txtIngredientsFocusNode?.dispose();
    txtIngredientsTextController?.dispose();

    txtPreparationFocusNode?.dispose();
    txtPreparationTextController?.dispose();
  }
}
