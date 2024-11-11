import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Profile-Page'});
    _model.displayNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displayNameFocusNode ??= FocusNode();

    _model.usernameTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.username, ''));
    _model.usernameFocusNode ??= FocusNode();

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Profile',
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
                              'PROFILE_PAGE_PAGE_ProfilePicture_ON_TAP');
                          logFirebaseEvent(
                              'ProfilePicture_upload_media_to_firebase');
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            maxWidth: 68.00,
                            maxHeight: 68.00,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
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
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 68.0,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        currentUserPhoto,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.uploadedFileUrl == '')
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                          ],
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.displayNameTextController,
                            focusNode: _model.displayNameFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Display Name...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
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
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.displayNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.usernameTextController,
                            focusNode: _model.usernameFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              alignLabelWithHint: false,
                              hintText: 'Username...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
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
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            maxLength: 32,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.usernameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      AuthUserStreamWidget(
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.hometownTextController,
                            focusNode: _model.hometownFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Hometown...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
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
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.hometownTextControllerValidator
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
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
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
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                            maxLines: null,
                            minLines: 4,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.bioTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('PROFILE_SaveProfileButton_ON_TAP');
                          logFirebaseEvent('SaveProfileButton_backend_call');

                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.displayNameTextController.text,
                            username: _model.usernameTextController.text,
                            hometown: _model.hometownTextController.text,
                            bio: _model.bioTextController.text,
                          ));
                          if (_model.uploadedFileUrl != '') {
                            logFirebaseEvent('SaveProfileButton_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              photoUrl: _model.uploadedFileUrl,
                            ));
                            logFirebaseEvent(
                                'SaveProfileButton_google_analytics_event');
                            logFirebaseEvent('UpdateAccount counter');
                          }
                          logFirebaseEvent('SaveProfileButton_navigate_to');

                          context.pushNamed('Homepage');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
