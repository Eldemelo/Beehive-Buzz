import '/components/user_post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for User_Post dynamic component.
  late FlutterFlowDynamicModels<UserPostModel> userPostModels;

  @override
  void initState(BuildContext context) {
    userPostModels = FlutterFlowDynamicModels(() => UserPostModel());
  }

  @override
  void dispose() {
    userPostModels.dispose();
  }
}
