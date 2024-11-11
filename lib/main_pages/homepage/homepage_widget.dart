import '/backend/backend.dart';
import '/components/user_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/icon.png',
                              width: 75.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<UserPostsRecord>>(
                        future: queryUserPostsRecordOnce(
                          queryBuilder: (userPostsRecord) => userPostsRecord
                              .orderBy('post_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LinearProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            );
                          }
                          List<UserPostsRecord> listViewUserPostsRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUserPostsRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewUserPostsRecord =
                                  listViewUserPostsRecordList[listViewIndex];
                              return wrapWithModel(
                                model: _model.userPostModels.getModel(
                                  listViewUserPostsRecord.reference.id,
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: UserPostWidget(
                                  key: Key(
                                    'Key614_${listViewUserPostsRecord.reference.id}',
                                  ),
                                  userPosts: listViewUserPostsRecord,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 12.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
