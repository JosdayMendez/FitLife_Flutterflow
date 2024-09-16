import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'chat_message_details_widget.dart' show ChatMessageDetailsWidget;
import 'package:flutter/material.dart';

class ChatMessageDetailsModel
    extends FlutterFlowModel<ChatMessageDetailsWidget> {
  ///  Local state fields for this component.

  bool showTime = false;

  bool showOtherTime = false;

  /// Query cache managers for this widget.

  final _userImageManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userImage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userImageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserImageCache() => _userImageManager.clear();
  void clearUserImageCacheKey(String? uniqueKey) =>
      _userImageManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearUserImageCache();
  }
}
