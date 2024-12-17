import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_event_widget.dart' show NewEventWidget;
import 'package:flutter/material.dart';

class NewEventModel extends FlutterFlowModel<NewEventWidget> {
  ///  Local state fields for this page.

  double thisPostLat = 40.7579746;

  double thisPostLong = -73.9904135;

  DateTime? eventDateTime;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EventName widget.
  FocusNode? eventNameFocusNode;
  TextEditingController? eventNameTextController;
  String? Function(BuildContext, String?)? eventNameTextControllerValidator;
  String? _eventNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LocSt widget.
  FocusNode? locStFocusNode;
  TextEditingController? locStTextController;
  String? Function(BuildContext, String?)? locStTextControllerValidator;
  String? _locStTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LocTown widget.
  FocusNode? locTownFocusNode;
  TextEditingController? locTownTextController;
  String? Function(BuildContext, String?)? locTownTextControllerValidator;
  String? _locTownTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LocState widget.
  FocusNode? locStateFocusNode;
  TextEditingController? locStateTextController;
  String? Function(BuildContext, String?)? locStateTextControllerValidator;
  String? _locStateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LocCode widget.
  FocusNode? locCodeFocusNode;
  TextEditingController? locCodeTextController;
  String? Function(BuildContext, String?)? locCodeTextControllerValidator;
  String? _locCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for EventDescription widget.
  FocusNode? eventDescriptionFocusNode;
  TextEditingController? eventDescriptionTextController;
  String? Function(BuildContext, String?)?
      eventDescriptionTextControllerValidator;
  String? _eventDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (reverseSearchCityState)] action in PostEventButton widget.
  ApiCallResponse? aPIReturnCoords;

  @override
  void initState(BuildContext context) {
    eventNameTextControllerValidator = _eventNameTextControllerValidator;
    locStTextControllerValidator = _locStTextControllerValidator;
    locTownTextControllerValidator = _locTownTextControllerValidator;
    locStateTextControllerValidator = _locStateTextControllerValidator;
    locCodeTextControllerValidator = _locCodeTextControllerValidator;
    eventDescriptionTextControllerValidator =
        _eventDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    eventNameFocusNode?.dispose();
    eventNameTextController?.dispose();

    locStFocusNode?.dispose();
    locStTextController?.dispose();

    locTownFocusNode?.dispose();
    locTownTextController?.dispose();

    locStateFocusNode?.dispose();
    locStateTextController?.dispose();

    locCodeFocusNode?.dispose();
    locCodeTextController?.dispose();

    eventDescriptionFocusNode?.dispose();
    eventDescriptionTextController?.dispose();
  }
}
