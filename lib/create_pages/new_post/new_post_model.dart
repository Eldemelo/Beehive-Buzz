import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_post_widget.dart' show NewPostWidget;
import 'package:flutter/material.dart';

class NewPostModel extends FlutterFlowModel<NewPostWidget> {
  ///  Local state fields for this page.

  double thisPostLat = 40.7579746;

  double thisPostLong = -73.9904135;

  String? uploadedPhoto;

  double loadingBar1 = 0.0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PostBody widget.
  FocusNode? postBodyFocusNode;
  TextEditingController? postBodyTextController;
  String? Function(BuildContext, String?)? postBodyTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
