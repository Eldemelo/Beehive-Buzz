import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_dropdown_widget.dart' show FilterDropdownWidget;
import 'package:flutter/material.dart';

class FilterDropdownModel extends FlutterFlowModel<FilterDropdownWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FilterSelect widget.
  FormFieldController<String>? filterSelectValueController;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get filterSelectValue => filterSelectValueController?.value;
}
