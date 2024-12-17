import '/components/user_post/user_post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_page_widget.dart' show UserProfilePageWidget;
import 'package:flutter/material.dart';

class UserProfilePageModel extends FlutterFlowModel<UserProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for User_Post dynamic component.
  late FlutterFlowDynamicModels<UserPostModel> userPostModels1;
  // Models for User_Post dynamic component.
  late FlutterFlowDynamicModels<UserPostModel> userPostModels2;

  @override
  void initState(BuildContext context) {
    userPostModels1 = FlutterFlowDynamicModels(() => UserPostModel());
    userPostModels2 = FlutterFlowDynamicModels(() => UserPostModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userPostModels1.dispose();
    userPostModels2.dispose();
  }
}
