import '/community/components/messages/messages_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_widget.dart' show ChatDetailsWidget;
import 'package:flutter/material.dart';

class ChatDetailsModel extends FlutterFlowModel<ChatDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for messages component.
  late MessagesModel messagesModel;

  @override
  void initState(BuildContext context) {
    messagesModel = createModel(context, () => MessagesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    messagesModel.dispose();
  }
}
