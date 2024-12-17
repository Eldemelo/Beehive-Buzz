import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_post/user_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_profile_page_model.dart';
export 'user_profile_page_model.dart';

class UserProfilePageWidget extends StatefulWidget {
  /// Page another a user will see of another user
  const UserProfilePageWidget({super.key});

  @override
  State<UserProfilePageWidget> createState() => _UserProfilePageWidgetState();
}

class _UserProfilePageWidgetState extends State<UserProfilePageWidget>
    with TickerProviderStateMixin {
  late UserProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfilePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'User-Profile-Page'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPostsRecord>>(
      future: queryUserPostsRecordOnce(),
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
        List<UserPostsRecord> userProfilePageUserPostsRecordList =
            snapshot.data!;

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
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  constraints: const BoxConstraints(
                    maxWidth: 450.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 150.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: Image.network(
                                              currentUserPhoto,
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                              currentUserDocument?.username,
                                              ''),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                            currentUserDocument?.bio, ''),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.hometown,
                                                ''),
                                            '[home-town]',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: const Alignment(0.0, 0),
                                      child: TabBar(
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  letterSpacing: 0.0,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: const EdgeInsets.all(6.0),
                                        tabs: const [
                                          Tab(
                                            text: 'My Posts',
                                          ),
                                          Tab(
                                            text: 'Liked Posts',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Stack(
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final userPosts =
                                                        userProfilePageUserPostsRecordList
                                                            .where((e) =>
                                                                currentUserReference ==
                                                                e.postUser)
                                                            .toList();

                                                    return RefreshIndicator(
                                                      onRefresh: () async {},
                                                      child: ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            userPosts.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            userPostsIndex) {
                                                          final userPostsItem =
                                                              userPosts[
                                                                  userPostsIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .userPostModels1
                                                                .getModel(
                                                              currentUserUid,
                                                              userPostsIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                UserPostWidget(
                                                              key: Key(
                                                                'Key489_$currentUserUid',
                                                              ),
                                                              userPosts:
                                                                  userPostsItem,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Stack(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final userPosts =
                                                            userProfilePageUserPostsRecordList
                                                                .where((e) => e
                                                                    .userLikes
                                                                    .contains(
                                                                        currentUserReference))
                                                                .toList();

                                                        return RefreshIndicator(
                                                          onRefresh:
                                                              () async {},
                                                          child: ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount: userPosts
                                                                .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    const SizedBox(
                                                                        height:
                                                                            8.0),
                                                            itemBuilder: (context,
                                                                userPostsIndex) {
                                                              final userPostsItem =
                                                                  userPosts[
                                                                      userPostsIndex];
                                                              return wrapWithModel(
                                                                model: _model
                                                                    .userPostModels2
                                                                    .getModel(
                                                                  currentUserUid,
                                                                  userPostsIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    UserPostWidget(
                                                                  key: Key(
                                                                    'Keyds5_$currentUserUid',
                                                                  ),
                                                                  userPosts:
                                                                      userPostsItem,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].addToStart(const SizedBox(height: 36.0)),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_PROFILE_Icon_1rboknie_ON_TAP');
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed('EditProfilePage');
                            },
                            child: Icon(
                              Icons.edit,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
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
