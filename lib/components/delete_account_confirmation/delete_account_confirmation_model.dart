import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_confirmation_widget.dart'
    show DeleteAccountConfirmationWidget;
import 'package:flutter/material.dart';

class DeleteAccountConfirmationModel
    extends FlutterFlowModel<DeleteAccountConfirmationWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SignUp_Email widget.
  FocusNode? signUpEmailFocusNode;
  TextEditingController? signUpEmailTextController;
  String? Function(BuildContext, String?)? signUpEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();
  }
}
