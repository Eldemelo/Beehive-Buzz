import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_dropdown_model.dart';
export 'filter_dropdown_model.dart';

class FilterDropdownWidget extends StatefulWidget {
  const FilterDropdownWidget({super.key});

  @override
  State<FilterDropdownWidget> createState() => _FilterDropdownWidgetState();
}

class _FilterDropdownWidgetState extends State<FilterDropdownWidget> {
  late FilterDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 20.0, 0.0),
      child: Container(
        width: 240.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sort By',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'FILTER_DROPDOWN_Icon_nlc8u1d6_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 36.0,
                          ),
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowRadioButton(
                        options: ['Most Recent', 'Most Liked'].toList(),
                        onChanged: (val) async {
                          safeSetState(() {});
                          logFirebaseEvent(
                              'FILTER_DROPDOWN_FilterSelect_ON_FORM_WID');
                          logFirebaseEvent('FilterSelect_update_app_state');
                          FFAppState().filterSelection =
                              _model.filterSelectValue!;
                          FFAppState().update(() {});
                        },
                        controller: _model.filterSelectValueController ??=
                            FormFieldController<String>(valueOrDefault<String>(
                          FFAppState().filterSelection,
                          'Most Recent',
                        )),
                        optionHeight: 32.0,
                        textStyle:
                            FlutterFlowTheme.of(context).labelSmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        selectedTextStyle: FlutterFlowTheme.of(context)
                            .labelSmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).tertiary,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ),
                  ].divide(const SizedBox(height: 20.0)),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Distance',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '${_model.sliderValue?.toString()} miles',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primary,
                      inactiveColor: FlutterFlowTheme.of(context).secondary,
                      min: 5.0,
                      max: 50.0,
                      value: _model.sliderValue ??= FFAppState().filterDistance,
                      divisions: 9,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.sliderValue = newValue);
                        logFirebaseEvent(
                            'FILTER_DROPDOWN_Slider_ubmfvnby_ON_FORM_');
                        logFirebaseEvent('Slider_update_app_state');
                        FFAppState().filterDistance = _model.sliderValue!;
                        FFAppState().update(() {});
                      },
                    ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
