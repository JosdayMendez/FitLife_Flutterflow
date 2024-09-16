import '/flutter_flow/flutter_flow_util.dart';
import 'restablecer_contrasena_widget.dart' show RestablecerContrasenaWidget;
import 'package:flutter/material.dart';

class RestablecerContrasenaModel
    extends FlutterFlowModel<RestablecerContrasenaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
