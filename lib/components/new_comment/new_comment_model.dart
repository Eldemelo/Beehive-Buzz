import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_comment_widget.dart' show NewCommentWidget;
import 'package:flutter/material.dart';

class NewCommentModel extends FlutterFlowModel<NewCommentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Body widget.
  FocusNode? bodyFocusNode;
  TextEditingController? bodyTextController;
  String? Function(BuildContext, String?)? bodyTextControllerValidator;
  // Stores action output result for [Backend Call - API (getCityState)] action in PostComment widget.
  ApiCallResponse? citystateresponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bodyFocusNode?.dispose();
    bodyTextController?.dispose();
  }
}
