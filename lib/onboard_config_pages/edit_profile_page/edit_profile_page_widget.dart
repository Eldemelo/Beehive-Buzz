import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'edit_profile_page_model.dart';
export 'edit_profile_page_model.dart';

class EditProfilePageWidget extends StatefulWidget {
  const EditProfilePageWidget({super.key});

  @override
  State<EditProfilePageWidget> createState() => _EditProfilePageWidgetState();
}

class _EditProfilePageWidgetState extends State<EditProfilePageWidget> {
  late EditProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditProfilePage'});
    _model.displayNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displayNameFocusNode ??= FocusNode();

    _model.usernameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.username, '') != ''
            ? functions.getUsernameWithoutAt(
                valueOrDefault(currentUserDocument?.username, ''))
            : '');
    _model.usernameFocusNode ??= FocusNode();
    _model.usernameFocusNode!.addListener(
      () async {
        logFirebaseEvent('EDIT_PROFILE_Username_ON_FOCUS_CHANGE');
        if ((_model.usernameFocusNode?.hasFocus ?? false)) {
          logFirebaseEvent('Username_update_page_state');
          _model.usernameFocused = true;
          safeSetState(() {});
        } else {
          logFirebaseEvent('Username_update_page_state');
          _model.usernameFocused = false;
          safeSetState(() {});
        }
      },
    );
    _model.hometownTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.hometown, ''));
    _model.hometownFocusNode ??= FocusNode();

    _model.bioTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
    _model.bioFocusNode ??= FocusNode();

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 1.0,
                constraints: const BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Opacity(
                                  opacity: 0.0,
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 32.0,
                                    ),
                                  ),
                                ),
                                if (valueOrDefault(
                                            currentUserDocument?.username,
                                            '') !=
                                        '')
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'EDIT_PROFILE_Icon_rt0rat4i_ON_TAP');
                                          logFirebaseEvent(
                                              'Icon_navigate_back');
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 32.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Update Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Lexend',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_ProfilePicture_ON_TAP');
                                logFirebaseEvent(
                                    'ProfilePicture_upload_media_to_firebase');
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 1200.00,
                                  maxHeight: 1200.00,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                logFirebaseEvent('ProfilePicture_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  photoUrl: _model.uploadedFileUrl,
                                ));
                              },
                              child: Stack(
                                alignment: const AlignmentDirectional(-1.0, 1.0),
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 8.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  currentUserPhoto,
                                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                                ),
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(200.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Visibility(
                                            visible: currentUserPhoto == '',
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Icon(
                                                Icons.add_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 48.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.displayNameTextController,
                                        focusNode: _model.displayNameFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Display Name...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: const EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .displayNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: _model.usernameFocused
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .accent1,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 18.0, 0.0, 12.0),
                                          child: Text(
                                            '@',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .usernameTextController,
                                                focusNode:
                                                    _model.usernameFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  alignLabelWithHint: false,
                                                  hintText: 'Username...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 24.0,
                                                              0.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 32,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .usernameTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(width: 1.0))
                                          .addToStart(const SizedBox(width: 24.0))
                                          .addToEnd(const SizedBox(width: 24.0)),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.hometownTextController,
                                        focusNode: _model.hometownFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Hometown...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: const EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .hometownTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.bioTextController,
                                        focusNode: _model.bioFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Bio...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding: const EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        minLines: 4,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .bioTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 6.0)),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_SaveProfileButton_ON_TAP');
                                logFirebaseEvent(
                                    'SaveProfileButton_validate_form');
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                logFirebaseEvent(
                                    'SaveProfileButton_update_page_state');
                                _model.usernameWithAt =
                                    functions.getUsernameString(
                                        _model.usernameTextController.text);
                                if (_model.usernameWithAt ==
                                    valueOrDefault(
                                        currentUserDocument?.username, '')) {
                                  logFirebaseEvent(
                                      'SaveProfileButton_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    displayName:
                                        _model.displayNameTextController.text,
                                    hometown:
                                        _model.hometownTextController.text,
                                    bio: _model.bioTextController.text,
                                  ));
                                  if (_model.uploadedFileUrl != '') {
                                    logFirebaseEvent(
                                        'SaveProfileButton_backend_call');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      photoUrl: _model.uploadedFileUrl,
                                    ));
                                    logFirebaseEvent(
                                        'SaveProfileButton_google_analytics_event');
                                    logFirebaseEvent('UpdateAccount counter');
                                  }
                                  logFirebaseEvent(
                                      'SaveProfileButton_navigate_back');
                                  context.safePop();
                                } else {
                                  logFirebaseEvent(
                                      'SaveProfileButton_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    prevUsername: '',
                                  ));
                                  logFirebaseEvent(
                                      'SaveProfileButton_firestore_query');
                                  _model.usernameTaken =
                                      await queryUsersRecordCount(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(Filter.or(
                                      Filter(
                                        'username',
                                        isEqualTo: _model.usernameWithAt,
                                      ),
                                      Filter(
                                        'prev_username',
                                        isEqualTo: _model.usernameWithAt,
                                      ),
                                    )),
                                  );
                                  if (_model.usernameTaken! > 0) {
                                    logFirebaseEvent(
                                        'SaveProfileButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'That username is taken.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    logFirebaseEvent(
                                        'SaveProfileButton_backend_call');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      prevUsername: valueOrDefault(
                                          currentUserDocument?.username, ''),
                                    ));
                                    logFirebaseEvent(
                                        'SaveProfileButton_backend_call');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      displayName:
                                          _model.displayNameTextController.text,
                                      username: _model.usernameWithAt,
                                      hometown:
                                          _model.hometownTextController.text,
                                      bio: _model.bioTextController.text,
                                    ));
                                    if (_model.uploadedFileUrl != '') {
                                      logFirebaseEvent(
                                          'SaveProfileButton_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        photoUrl: _model.uploadedFileUrl,
                                      ));
                                      logFirebaseEvent(
                                          'SaveProfileButton_google_analytics_event');
                                      logFirebaseEvent('UpdateAccount counter');
                                    }
                                    logFirebaseEvent(
                                        'SaveProfileButton_firestore_query');
                                    _model.usernameTaken2 =
                                        await queryUsersRecordCount(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(Filter.or(
                                        Filter(
                                          'username',
                                          isEqualTo: _model.usernameWithAt,
                                        ),
                                        Filter(
                                          'prev_username',
                                          isEqualTo: valueOrDefault(
                                              currentUserDocument?.username,
                                              ''),
                                        ),
                                      )),
                                    );
                                    if (_model.usernameTaken2! >= 2) {
                                      logFirebaseEvent(
                                          'SaveProfileButton_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        username: valueOrDefault(
                                            currentUserDocument?.prevUsername,
                                            ''),
                                        prevUsername: '',
                                      ));
                                      logFirebaseEvent(
                                          'SaveProfileButton_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'That username is taken.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'SaveProfileButton_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        prevUsername: '',
                                      ));
                                      logFirebaseEvent(
                                          'SaveProfileButton_navigate_back');
                                      context.safePop();
                                    }
                                  }
                                }

                                safeSetState(() {});
                              },
                              text: 'Save Profile',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ].divide(const SizedBox(height: 24.0)),
                        ),
                      ),
                    ],
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
