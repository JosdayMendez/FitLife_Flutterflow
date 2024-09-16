import '/flutter_flow/flutter_flow_util.dart';
import 'option_messages_widget.dart' show OptionMessagesWidget;
import 'package:flutter/material.dart';

class OptionMessagesModel extends FlutterFlowModel<OptionMessagesWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
