import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_page_widget.dart' show CommentsPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CommentsPageModel extends FlutterFlowModel<CommentsPageWidget> {
  ///  Local state fields for this page.

  int? numLikes;

  bool isLiked = false;

  ///  State fields for stateful widgets in this page.

  Completer<List<CommentsRecord>>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
