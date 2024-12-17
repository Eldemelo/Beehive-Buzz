import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'new_post_model.dart';
export 'new_post_model.dart';

class NewPostWidget extends StatefulWidget {
  const NewPostWidget({super.key});

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends State<NewPostWidget>
    with TickerProviderStateMixin {
  late NewPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'New-Post'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_POST_PAGE_New-Post_ON_INIT_STATE');
      logFirebaseEvent('New-Post_request_permissions');
      await requestPermission(locationPermission);
      logFirebaseEvent('New-Post_update_page_state');
      _model.thisPostLat = 40.7579746;
      _model.thisPostLong = -73.9904135;
      safeSetState(() {});
    });

    _model.postBodyTextController ??= TextEditingController();
    _model.postBodyFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(-100.0, 0.0),
            end: const Offset(100.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              constraints: const BoxConstraints(
                maxWidth: 450.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'NEW_POST_PAGE_Icon_7yb66lzn_ON_TAP');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  'Homepage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 36.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New Post',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                      currentUserDocument
                                                          ?.username,
                                                      ''),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 600),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  key:
                                                      const ValueKey('PostBody_02v4'),
                                                  controller: _model
                                                      .postBodyTextController,
                                                  focusNode:
                                                      _model.postBodyFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: 'Body...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets.all(24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLines: 6,
                                                  minLines: 1,
                                                  maxLength: 1000,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  buildCounter: (context,
                                                          {required currentLength,
                                                          required isFocused,
                                                          maxLength}) =>
                                                      null,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .postBodyTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              if (_model.uploadedPhoto ==
                                                      null ||
                                                  _model.uploadedPhoto == '')
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'NEW_POST_PAGE_Container_uhihxdss_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_upload_media_to_firebase');
                                                        final selectedMedia =
                                                            await selectMediaWithSourceBottomSheet(
                                                          context: context,
                                                          maxWidth: 1920.00,
                                                          maxHeight: 1080.00,
                                                          allowPhoto: true,
                                                        );
                                                        if (selectedMedia !=
                                                                null &&
                                                            selectedMedia.every((m) =>
                                                                validateFileFormat(
                                                                    m.storagePath,
                                                                    context))) {
                                                          safeSetState(() =>
                                                              _model.isDataUploading =
                                                                  true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];

                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles =
                                                                selectedMedia
                                                                    .map((m) =>
                                                                        FFUploadedFile(
                                                                          name: m
                                                                              .storagePath
                                                                              .split('/')
                                                                              .last,
                                                                          bytes:
                                                                              m.bytes,
                                                                          height: m
                                                                              .dimensions
                                                                              ?.height,
                                                                          width: m
                                                                              .dimensions
                                                                              ?.width,
                                                                          blurHash:
                                                                              m.blurHash,
                                                                        ))
                                                                    .toList();

                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes),
                                                              ),
                                                            ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                          } finally {
                                                            _model.isDataUploading =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
                                                            return;
                                                          }
                                                        }

                                                        logFirebaseEvent(
                                                            'Container_update_page_state');
                                                        _model.uploadedPhoto =
                                                            _model
                                                                .uploadedFileUrl;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Upload Image',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .add_photo_alternate_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      const SizedBox(width: 12.0)),
                                                ),
                                            ].addToEnd(const SizedBox(height: 12.0)),
                                          ),
                                          if (_model.isDataUploading)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Stack(
                                                  children: [
                                                    if (_model.uploadedPhoto !=
                                                            null &&
                                                        _model.uploadedPhoto !=
                                                            '')
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(6.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                child: Image
                                                                    .network(
                                                                  _model
                                                                      .uploadedPhoto!,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.uploadedPhoto !=
                                                            null &&
                                                        _model.uploadedPhoto !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  12.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'NEW_POST_PAGE_Container_0drxcwct_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model.uploadedPhoto =
                                                                  null;
                                                              safeSetState(
                                                                  () {});
                                                              logFirebaseEvent(
                                                                  'Container_clear_uploaded_data');
                                                              safeSetState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xCC14181B),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            6.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .delete_outline,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                            FFButtonWidget(
                              key: const ValueKey('Button_i4o9'),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'NEW_POST_PAGE_POST_BUZZ_BTN_ON_TAP');
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: const LatLng(0.0, 0.0));
                                logFirebaseEvent('Button_update_page_state');
                                _model.thisPostLat = valueOrDefault<double>(
                                  functions
                                      .getLatitude(currentUserLocationValue!),
                                  40.7579746,
                                );
                                _model.thisPostLong = valueOrDefault<double>(
                                  functions
                                      .getLongitude(currentUserLocationValue!),
                                  -73.9904135,
                                );
                                safeSetState(() {});
                                if (_model.thisPostLat != 0.0) {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.cityStateResponse =
                                      await GetCityStateCall.call(
                                    latitude: _model.thisPostLat,
                                    longitude: _model.thisPostLong,
                                  );

                                  if ((_model.cityStateResponse?.succeeded ??
                                          true) ==
                                      true) {
                                    if (_model.uploadedPhoto != null &&
                                        _model.uploadedPhoto != '') {
                                      if (GetCityStateCall.city(
                                                (_model.cityStateResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          GetCityStateCall.city(
                                                (_model.cityStateResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              '') {
                                        logFirebaseEvent('Button_backend_call');

                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              displayName:
                                                  currentUserDisplayName,
                                              username: valueOrDefault(
                                                  currentUserDocument?.username,
                                                  ''),
                                              postBody: valueOrDefault<String>(
                                                _model.postBodyTextController
                                                    .text,
                                                'No Post Body',
                                              ),
                                              displayPhotoUrl: currentUserPhoto,
                                              postUser: currentUserReference,
                                              postTime: getCurrentTimestamp,
                                              postCoords:
                                                  currentUserLocationValue,
                                              postCity: valueOrDefault<String>(
                                                GetCityStateCall.city(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'city',
                                              ),
                                              postState: functions.shortenState(
                                                  valueOrDefault<String>(
                                                GetCityStateCall.state(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'New York',
                                              )),
                                              postLat: _model.thisPostLat,
                                              postLong: _model.thisPostLong,
                                              photoUrl: _model.uploadedFileUrl,
                                            ));
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              displayName:
                                                  currentUserDisplayName,
                                              username: valueOrDefault(
                                                  currentUserDocument?.username,
                                                  ''),
                                              postBody: valueOrDefault<String>(
                                                _model.postBodyTextController
                                                    .text,
                                                'No Post Body',
                                              ),
                                              displayPhotoUrl: currentUserPhoto,
                                              postUser: currentUserReference,
                                              postTime: getCurrentTimestamp,
                                              postCoords:
                                                  currentUserLocationValue,
                                              postCity: valueOrDefault<String>(
                                                GetCityStateCall.town(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'city',
                                              ),
                                              postState: functions.shortenState(
                                                  valueOrDefault<String>(
                                                GetCityStateCall.state(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'New York',
                                              )),
                                              postLat: _model.thisPostLat,
                                              postLong: _model.thisPostLong,
                                              photoUrl: _model.uploadedFileUrl,
                                            ));
                                      }
                                    } else {
                                      if (GetCityStateCall.city(
                                                (_model.cityStateResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null &&
                                          GetCityStateCall.city(
                                                (_model.cityStateResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              '') {
                                        logFirebaseEvent('Button_backend_call');

                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              displayName:
                                                  currentUserDisplayName,
                                              username: valueOrDefault(
                                                  currentUserDocument?.username,
                                                  ''),
                                              postBody: valueOrDefault<String>(
                                                _model.postBodyTextController
                                                    .text,
                                                'No Post Body',
                                              ),
                                              displayPhotoUrl: currentUserPhoto,
                                              postUser: currentUserReference,
                                              postTime: getCurrentTimestamp,
                                              postCoords:
                                                  currentUserLocationValue,
                                              postCity: valueOrDefault<String>(
                                                GetCityStateCall.city(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'city',
                                              ),
                                              postState: functions.shortenState(
                                                  valueOrDefault<String>(
                                                GetCityStateCall.state(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'New York',
                                              )),
                                              postLat: _model.thisPostLat,
                                              postLong: _model.thisPostLong,
                                            ));
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              displayName:
                                                  currentUserDisplayName,
                                              username: valueOrDefault(
                                                  currentUserDocument?.username,
                                                  ''),
                                              postBody: valueOrDefault<String>(
                                                _model.postBodyTextController
                                                    .text,
                                                'No Post Body',
                                              ),
                                              displayPhotoUrl: currentUserPhoto,
                                              postUser: currentUserReference,
                                              postTime: getCurrentTimestamp,
                                              postCoords:
                                                  currentUserLocationValue,
                                              postCity: valueOrDefault<String>(
                                                GetCityStateCall.town(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'city',
                                              ),
                                              postState: functions.shortenState(
                                                  valueOrDefault<String>(
                                                GetCityStateCall.state(
                                                  (_model.cityStateResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                'New York',
                                              )),
                                              postLat: _model.thisPostLat,
                                              postLong: _model.thisPostLong,
                                            ));
                                      }
                                    }

                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Sent Post!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamed('Homepage');
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Failure to retrieve City & State',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Unable to get location',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Post Buzz',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 70.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 30.0)),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 0.0))
                        .around(const SizedBox(height: 0.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
