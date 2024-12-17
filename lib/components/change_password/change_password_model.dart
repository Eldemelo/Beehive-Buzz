import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for newPasswordConfirm widget.
  FocusNode? newPasswordConfirmFocusNode;
  TextEditingController? newPasswordConfirmTextController;
  late bool newPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      newPasswordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
    newPasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    newPasswordConfirmFocusNode?.dispose();
    newPasswordConfirmTextController?.dispose();
  }
}
