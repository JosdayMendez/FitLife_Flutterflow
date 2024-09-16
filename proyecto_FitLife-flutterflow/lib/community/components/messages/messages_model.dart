import '/backend/backend.dart';
import '/community/components/chat_message_details/chat_message_details_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  Local state fields for this component.

  List<String> attachedImages = [];
  void addToAttachedImages(String item) => attachedImages.add(item);
  void removeFromAttachedImages(String item) => attachedImages.remove(item);
  void removeAtIndexFromAttachedImages(int index) =>
      attachedImages.removeAt(index);
  void insertAtIndexInAttachedImages(int index, String item) =>
      attachedImages.insert(index, item);
  void updateAttachedImagesAtIndex(int index, Function(String) updateFn) =>
      attachedImages[index] = updateFn(attachedImages[index]);

  bool showImages = false;

  List<ChatsListRecord> chatRef = [];
  void addToChatRef(ChatsListRecord item) => chatRef.add(item);
  void removeFromChatRef(ChatsListRecord item) => chatRef.remove(item);
  void removeAtIndexFromChatRef(int index) => chatRef.removeAt(index);
  void insertAtIndexInChatRef(int index, ChatsListRecord item) =>
      chatRef.insert(index, item);
  void updateChatRefAtIndex(int index, Function(ChatsListRecord) updateFn) =>
      chatRef[index] = updateFn(chatRef[index]);

  ///  State fields for stateful widgets in this component.

  // Models for chatMessageDetails dynamic component.
  late FlutterFlowDynamicModels<ChatMessageDetailsModel>
      chatMessageDetailsModels;
  // Stores action output result for [Bottom Sheet - optionMessages] action in IconButton widget.
  List<String>? listImages;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    chatMessageDetailsModels =
        FlutterFlowDynamicModels(() => ChatMessageDetailsModel());
  }

  @override
  void dispose() {
    chatMessageDetailsModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
