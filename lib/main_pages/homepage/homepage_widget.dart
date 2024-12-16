import '/backend/backend.dart';
import '/components/filter_dropdown/filter_dropdown_widget.dart';
import '/components/user_post/user_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Homepage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOMEPAGE_PAGE_Homepage_ON_INIT_STATE');
      logFirebaseEvent('Homepage_request_permissions');
      await requestPermission(locationPermission);
      if (FFAppState().filterSelection == 'Most Recent') {
        logFirebaseEvent('Homepage_update_page_state');
        _model.filterSelect = 'created_time';
        safeSetState(() {});
      } else {
        logFirebaseEvent('Homepage_update_page_state');
        _model.filterSelect = 'post_likes';
        safeSetState(() {});
      }

      if (!(await getPermissionStatus(locationPermission))) {
        logFirebaseEvent('Homepage_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Location Access Needed'),
              content: const Text(
                  'Please enable location services to display posts relevant to your area.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: LinearProgressIndicator(
            color: FlutterFlowTheme.of(context).primary,
          ),
        ),
      );
    }

    return FutureBuilder<List<UserPostsRecord>>(
      future: (_model.firestoreRequestCompleter ??=
              Completer<List<UserPostsRecord>>()
                ..complete(queryUserPostsRecordOnce(
                  queryBuilder: (userPostsRecord) =>
                      userPostsRecord.orderBy('post_time', descending: true),
                )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: LinearProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<UserPostsRecord> homepageUserPostsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 450.0,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/image.png',
                                    width: 75.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOMEPAGE_PAGE_Icon_h9mmwqaf_ON_TAP');
                                        logFirebaseEvent('Icon_alert_dialog');
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: true,
                                          targetAnchor: const AlignmentDirectional(
                                                  -1.0, 1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: const AlignmentDirectional(
                                                  -1.0, 1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: const FilterDropdownWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                if (FFAppState().filterSelection ==
                                    'Most Recent')
                                  Builder(
                                    builder: (context) {
                                      final postsInRange = functions
                                              .filterPosts(
                                                  homepageUserPostsRecordList
                                                      .toList(),
                                                  functions
                                                      .getLatitude(
                                                          currentUserLocationValue!)
                                                      .toString(),
                                                  functions
                                                      .getLongitude(
                                                          currentUserLocationValue!)
                                                      .toString(),
                                                  valueOrDefault<double>(
                                                    FFAppState().filterDistance,
                                                    5.0,
                                                  ))
                                              ?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'HOMEmostRecent_ON_PULL_TO_REFRESH');
                                          logFirebaseEvent(
                                              'mostRecent_refresh_database_request');
                                          safeSetState(() =>
                                              _model.firestoreRequestCompleter =
                                                  null);
                                          await _model
                                              .waitForFirestoreRequestCompleted();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: postsInRange.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, postsInRangeIndex) {
                                            final postsInRangeItem =
                                                postsInRange[postsInRangeIndex];
                                            return UserPostWidget(
                                              key: Key(
                                                  'Key6v3_${postsInRangeIndex}_of_${postsInRange.length}'),
                                              userPosts: postsInRangeItem,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                if (FFAppState().filterSelection ==
                                    'Most Liked')
                                  Builder(
                                    builder: (context) {
                                      final postsInRange = functions
                                              .filterPosts(
                                                  homepageUserPostsRecordList
                                                      .toList(),
                                                  functions
                                                      .getLatitude(
                                                          currentUserLocationValue!)
                                                      .toString(),
                                                  functions
                                                      .getLongitude(
                                                          currentUserLocationValue!)
                                                      .toString(),
                                                  FFAppState().filterDistance)
                                              ?.sortedList(
                                                  keyOf: (e) =>
                                                      e.userLikes.length,
                                                  desc: true)
                                              .toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'HOMEmostLiked_ON_PULL_TO_REFRESH');
                                          logFirebaseEvent(
                                              'mostLiked_refresh_database_request');
                                          safeSetState(() =>
                                              _model.firestoreRequestCompleter =
                                                  null);
                                          await _model
                                              .waitForFirestoreRequestCompleted();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: postsInRange.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 8.0),
                                          itemBuilder:
                                              (context, postsInRangeIndex) {
                                            final postsInRangeItem =
                                                postsInRange[postsInRangeIndex];
                                            return UserPostWidget(
                                              key: Key(
                                                  'Keyr5k_${postsInRangeIndex}_of_${postsInRange.length}'),
                                              userPosts: postsInRangeItem,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 4.0, 12.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOMEPAGE_PAGE_NEW_POST_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'New-Post',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                        ),
                                      },
                                    );
                                  },
                                  text: 'New Post',
                                  icon: const Icon(
                                    Icons.article,
                                    size: 30.0,
                                  ),
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 45.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
