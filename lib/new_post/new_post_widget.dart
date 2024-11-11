import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'new_post_model.dart';
export 'new_post_model.dart';

class NewPostWidget extends StatefulWidget {
  const NewPostWidget({super.key});

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget> {
  late NewPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'New-Post'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_POST_PAGE_New-Post_ON_INIT_STATE');
      logFirebaseEvent('New-Post_backend_call');
      _model.apiResultpm9 = await GetCityStateCall.call();
    });

    _model.postBodyTextController ??= TextEditingController();
    _model.postBodyFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'New Post',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Lexend',
                      letterSpacing: 0.0,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 50.0,
                                height: 50.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  currentUserPhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    currentUserDisplayName,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault(
                                        currentUserDocument?.username, ''),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ].divide(const SizedBox(width: 15.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 6.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.postBodyTextController,
                          focusNode: _model.postBodyFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Body...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).tertiary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: const EdgeInsets.all(24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: null,
                          minLines: 8,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.postBodyTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('NEW_POST_PAGE_POST_BUZZ_BTN_ON_TAP');
                  currentUserLocationValue = await getCurrentUserLocation(
                      defaultLocation: const LatLng(0.0, 0.0));
                  logFirebaseEvent('Button_backend_call');
                  _model.cityStateResponse = await GetCityStateCall.call(
                    latitude: valueOrDefault<double>(
                      functions.getLatitude(currentUserLocationValue!),
                      40.711049,
                    ),
                    longitude: valueOrDefault<double>(
                      functions.getLongitude(currentUserLocationValue!),
                      -74.006573,
                    ),
                  );

                  if ((_model.cityStateResponse?.succeeded ?? true) == true) {
                    logFirebaseEvent('Button_backend_call');

                    await UserPostsRecord.collection
                        .doc()
                        .set(createUserPostsRecordData(
                          displayName: currentUserDisplayName,
                          username:
                              valueOrDefault(currentUserDocument?.username, ''),
                          postBody: valueOrDefault<String>(
                            _model.postBodyTextController.text,
                            'No Post Body',
                          ),
                          displayPhotoUrl: currentUserPhoto,
                          postUser: currentUserReference,
                          postTime: getCurrentTimestamp,
                          postCoords: currentUserLocationValue,
                          postCity: valueOrDefault<String>(
                            GetCityStateCall.city(
                              (_model.cityStateResponse?.jsonBody ?? ''),
                            ),
                            'city',
                          ),
                          postState: valueOrDefault<String>(
                            GetCityStateCall.state(
                              (_model.cityStateResponse?.jsonBody ?? ''),
                            ),
                            'state',
                          ),
                        ));
                    logFirebaseEvent('Button_navigate_to');

                    context.goNamed('Homepage');
                  } else {
                    logFirebaseEvent('Button_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          (_model.cityStateResponse?.statusCode ?? 200)
                              .toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  }

                  safeSetState(() {});
                },
                text: 'Post Buzz',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 70.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ].divide(const SizedBox(height: 60.0)).around(const SizedBox(height: 60.0)),
          ),
        ),
      ),
    );
  }
}
