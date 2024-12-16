import '/flutter_flow/flutter_flow_util.dart';
import 'user_post_widget.dart' show UserPostWidget;
import 'package:flutter/material.dart';

class UserPostModel extends FlutterFlowModel<UserPostWidget> {
  ///  Local state fields for this component.

  int numLikes = 0;

  bool isLiked = false;

  int? numComments = 0;

  String? postPhoto;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in User_Post widget.
  int? commentCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
