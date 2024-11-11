import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_post_widget.dart' show NewPostWidget;
import 'package:flutter/material.dart';

class NewPostModel extends FlutterFlowModel<NewPostWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getCityState)] action in New-Post widget.
  ApiCallResponse? apiResultpm9;
  // State field(s) for PostBody widget.
  FocusNode? postBodyFocusNode;
  TextEditingController? postBodyTextController;
  String? Function(BuildContext, String?)? postBodyTextControllerValidator;
  // Stores action output result for [Backend Call - API (getCityState)] action in Button widget.
  ApiCallResponse? cityStateResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postBodyFocusNode?.dispose();
    postBodyTextController?.dispose();
  }
}
