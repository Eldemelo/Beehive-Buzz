import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'new_comment_model.dart';
export 'new_comment_model.dart';

class NewCommentWidget extends StatefulWidget {
  const NewCommentWidget({
    super.key,
    required this.originalPost,
  });

  final UserPostsRecord? originalPost;

  @override
  State<NewCommentWidget> createState() => _NewCommentWidgetState();
}

class _NewCommentWidgetState extends State<NewCommentWidget> {
  late NewCommentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCommentModel());

    _model.bodyTextController ??= TextEditingController();
    _model.bodyFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 300.0,
        constraints: const BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Text(
                    'New Comment',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
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
                      logFirebaseEvent('NEW_COMMENT_COMP_Icon_ksynnilr_ON_TAP');
                      logFirebaseEvent('Icon_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.bodyTextController,
                  focusNode: _model.bodyFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Body...',
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  maxLines: 4,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.bodyTextControllerValidator.asValidator(context),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('NEW_COMMENT_COMP_PostComment_ON_TAP');
                  currentUserLocationValue = await getCurrentUserLocation(
                      defaultLocation: const LatLng(0.0, 0.0));
                  logFirebaseEvent('PostComment_backend_call');
                  _model.citystateresponse = await GetCityStateCall.call(
                    latitude: functions.getLatitude(currentUserLocationValue!),
                    longitude:
                        functions.getLongitude(currentUserLocationValue!),
                  );

                  if ((_model.citystateresponse?.succeeded ?? true) == true) {
                    if (GetCityStateCall.city(
                              (_model.citystateresponse?.jsonBody ?? ''),
                            ) !=
                            null &&
                        GetCityStateCall.city(
                              (_model.citystateresponse?.jsonBody ?? ''),
                            ) !=
                            '') {
                      logFirebaseEvent('PostComment_backend_call');

                      await CommentsRecord.createDoc(
                              widget.originalPost!.reference)
                          .set(createCommentsRecordData(
                        body: _model.bodyTextController.text,
                        commentUser: currentUserReference,
                        commentTime: getCurrentTimestamp,
                        commentCity: GetCityStateCall.city(
                          (_model.citystateresponse?.jsonBody ?? ''),
                        ),
                        commentState: GetCityStateCall.state(
                          (_model.citystateresponse?.jsonBody ?? ''),
                        ),
                      ));
                    } else {
                      logFirebaseEvent('PostComment_backend_call');

                      await CommentsRecord.createDoc(
                              widget.originalPost!.reference)
                          .set(createCommentsRecordData(
                        body: _model.bodyTextController.text,
                        commentUser: currentUserReference,
                        commentTime: getCurrentTimestamp,
                        commentCity: GetCityStateCall.town(
                          (_model.citystateresponse?.jsonBody ?? ''),
                        ),
                        commentState: GetCityStateCall.state(
                          (_model.citystateresponse?.jsonBody ?? ''),
                        ),
                      ));
                    }

                    logFirebaseEvent('PostComment_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Posted Comment!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).success,
                      ),
                    );
                    logFirebaseEvent('PostComment_update_app_state');

                    _model.updatePage(() {});
                    logFirebaseEvent('PostComment_bottom_sheet');
                    Navigator.pop(context);
                  } else {
                    logFirebaseEvent('PostComment_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Unable to retrieve location',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  }

                  safeSetState(() {});
                },
                text: 'Post Comment',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).accent1,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
