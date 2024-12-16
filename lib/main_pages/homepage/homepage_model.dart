import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  Local state fields for this page.

  int currDistance = 5;

  String filterSelect = 'created_time';

  List<UserPostsRecord> queryResults = [];
  void addToQueryResults(UserPostsRecord item) => queryResults.add(item);
  void removeFromQueryResults(UserPostsRecord item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, UserPostsRecord item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(UserPostsRecord) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  ///  State fields for stateful widgets in this page.

  Completer<List<UserPostsRecord>>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future updatepageonslider(BuildContext context) async {}

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
