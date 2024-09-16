import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chats_starts_widget.dart' show ChatsStartsWidget;
import 'package:flutter/material.dart';

class ChatsStartsModel extends FlutterFlowModel<ChatsStartsWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> chatUser = [];
  void addToChatUser(DocumentReference item) => chatUser.add(item);
  void removeFromChatUser(DocumentReference item) => chatUser.remove(item);
  void removeAtIndexFromChatUser(int index) => chatUser.removeAt(index);
  void insertAtIndexInChatUser(int index, DocumentReference item) =>
      chatUser.insert(index, item);
  void updateChatUserAtIndex(int index, Function(DocumentReference) updateFn) =>
      chatUser[index] = updateFn(chatUser[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsListRecord? createdChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
