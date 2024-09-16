import '/flutter_flow/flutter_flow_util.dart';
import 'meal_details_widget.dart' show MealDetailsWidget;
import 'package:flutter/material.dart';

class MealDetailsModel extends FlutterFlowModel<MealDetailsWidget> {
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
  FocusNode? ddMealTypeFocusNode;
  TextEditingController? ddMealTypeTextController;
  String? Function(BuildContext, String?)? ddMealTypeTextControllerValidator;

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

    ddMealTypeFocusNode?.dispose();
    ddMealTypeTextController?.dispose();
  }
}
