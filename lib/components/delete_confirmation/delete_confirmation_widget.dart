import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'delete_confirmation_model.dart';
export 'delete_confirmation_model.dart';

class DeleteConfirmationWidget extends StatefulWidget {
  const DeleteConfirmationWidget({
    super.key,
    required this.referencePost,
  });

  final DocumentReference? referencePost;

  @override
  State<DeleteConfirmationWidget> createState() =>
      _DeleteConfirmationWidgetState();
}

class _DeleteConfirmationWidgetState extends State<DeleteConfirmationWidget>
    with TickerProviderStateMixin {
  late DeleteConfirmationModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteConfirmationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DELETE_CONFIRMATION_deleteConfirmation_O');
      logFirebaseEvent('deleteConfirmation_haptic_feedback');
      HapticFeedback.vibrate();
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            hz: 6,
            offset: const Offset(0.0, 0.0),
            rotation: 0.052,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delete ',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).error,
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'Post?',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Lexend',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'This action is',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  'irreversible',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELETE_CONFIRMATION_COMP_Cancel_ON_TAP');
                    logFirebaseEvent('Cancel_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 70.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELETE_CONFIRMATION_DELETE_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');
                    await widget.referencePost!.delete();
                    logFirebaseEvent('Button_update_app_state');

                    _model.updatePage(() {});
                    logFirebaseEvent('Button_dismiss_dialog');
                    Navigator.pop(context);
                  },
                  text: 'Delete',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 70.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).error,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          decoration: TextDecoration.underline,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ].divide(const SizedBox(height: 6.0)),
            ),
          ].divide(const SizedBox(height: 40.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
