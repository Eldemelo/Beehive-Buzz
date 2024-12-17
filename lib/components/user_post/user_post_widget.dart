import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_post_model.dart';
export 'user_post_model.dart';

class UserPostWidget extends StatefulWidget {
  const UserPostWidget({
    super.key,
    required this.userPosts,
    String? numLikes,
  }) : numLikes = numLikes ?? '0';

  final UserPostsRecord? userPosts;
  final String numLikes;

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {
  late UserPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPostModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_POST_COMP_User_Post_ON_INIT_STATE');
      logFirebaseEvent('User_Post_update_component_state');
      _model.numLikes = widget.userPosts!.userLikes.length;
      _model.isLiked =
          widget.userPosts?.userLikes.contains(currentUserReference) == true;
      safeSetState(() {});
      logFirebaseEvent('User_Post_firestore_query');
      _model.commentCount = await queryCommentsRecordCount(
        parent: widget.userPosts?.reference,
      );
      logFirebaseEvent('User_Post_update_component_state');
      _model.numComments = _model.commentCount;
      safeSetState(() {});
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
    return FutureBuilder<UsersRecord>(
      future: UsersRecord.getDocumentOnce(widget.userPosts!.postUser!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          );
        }

        final containerUsersRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  containerUsersRecord.photoUrl,
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(68.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 0.25,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerUsersRecord.displayName,
                                  'NullName',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  containerUsersRecord.username,
                                  '@nullusername',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.userPosts?.postCity}, ${widget.userPosts?.postState}',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ].divide(const SizedBox(width: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.userPosts?.photoUrl != null &&
                            widget.userPosts?.photoUrl != '')
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_POST_COMP_Image_apsoy9sp_ON_TAP');
                                    logFirebaseEvent('Image_expand_image');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            widget.userPosts!.photoUrl,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: true,
                                          tag: widget.userPosts!.photoUrl,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: widget.userPosts!.photoUrl,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        widget.userPosts!.photoUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            widget.userPosts!.postBody,
                            maxLines: 10,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'USER_POST_COMP_Row_ufi1ysfq_ON_TAP');
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed(
                                'comments_page',
                                queryParameters: {
                                  'originalPost': serializeParam(
                                    widget.userPosts,
                                    ParamType.Document,
                                  ),
                                  'numComments': serializeParam(
                                    _model.commentCount,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'originalPost': widget.userPosts,
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.scale,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.insert_comment_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.numComments?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('USER_POST_COMP_Likes_ON_TAP');
                            if (_model.isLiked) {
                              logFirebaseEvent('Likes_update_component_state');
                              _model.numLikes = _model.numLikes + -1;
                              _model.isLiked = false;
                              safeSetState(() {});
                              logFirebaseEvent('Likes_backend_call');

                              await widget.userPosts!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'userLikes': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            } else {
                              logFirebaseEvent('Likes_update_component_state');
                              _model.numLikes = _model.numLikes + 1;
                              _model.isLiked = true;
                              safeSetState(() {});
                              logFirebaseEvent('Likes_backend_call');

                              await widget.userPosts!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'userLikes': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    if (_model.isLiked == false)
                                      Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    if (_model.isLiked == true)
                                      Icon(
                                        Icons.favorite_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                  ],
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.numLikes.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            dateTimeFormat(
                                "relative", widget.userPosts!.postTime!),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          if (widget.userPosts?.postUser?.id ==
                              currentUserReference?.id)
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'USER_POST_COMP_Container_5scwlncg_ON_TAP');
                                  logFirebaseEvent('Container_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: DeleteConfirmationWidget(
                                          referencePost:
                                              widget.userPosts!.reference,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Icon(
                                    Icons.delete_outlined,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                        ].divide(const SizedBox(width: 6.0)),
                      ),
                    ),
                  ].divide(const SizedBox(width: 20.0)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
