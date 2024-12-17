import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'user_comment_model.dart';
export 'user_comment_model.dart';

class UserCommentWidget extends StatefulWidget {
  const UserCommentWidget({
    super.key,
    required this.userComment,
  });

  final CommentsRecord? userComment;

  @override
  State<UserCommentWidget> createState() => _UserCommentWidgetState();
}

class _UserCommentWidgetState extends State<UserCommentWidget> {
  late UserCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCommentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_COMMENT_User_comment_ON_INIT_STATE');
      logFirebaseEvent('User_comment_update_component_state');
      _model.numLikes = widget.userComment!.commentLikes.length;
      _model.isLiked =
          widget.userComment?.commentLikes.contains(currentUserReference) ==
              true;
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
    return StreamBuilder<CommentsRecord>(
      stream: CommentsRecord.getDocument(widget.userComment!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          );
        }

        final containerCommentsRecord = snapshot.data!;

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
            child: FutureBuilder<UsersRecord>(
              future: UsersRecord.getDocumentOnce(
                  containerCommentsRecord.commentUser!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                }

                final columnUsersRecord = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
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
                                        columnUsersRecord.photoUrl,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.25,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      columnUsersRecord.displayName,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      columnUsersRecord.username,
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
                              children: [
                                Text(
                                  '${widget.userComment?.commentCity}, ${widget.userComment?.commentState}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 6.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Text(
                          containerCommentsRecord.body,
                          maxLines: 10,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'USER_COMMENT_COMP_Likes_ON_TAP');
                                  if (_model.isLiked) {
                                    logFirebaseEvent(
                                        'Likes_update_component_state');
                                    _model.numLikes = _model.numLikes + -1;
                                    _model.isLiked = false;
                                    safeSetState(() {});
                                    logFirebaseEvent('Likes_backend_call');

                                    await widget.userComment!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'comment_likes':
                                              FieldValue.arrayRemove(
                                                  [currentUserReference]),
                                        },
                                      ),
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Likes_update_component_state');
                                    _model.numLikes = _model.numLikes + 1;
                                    _model.isLiked = true;
                                    safeSetState(() {});
                                    logFirebaseEvent('Likes_backend_call');

                                    await widget.userComment!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'comment_likes':
                                              FieldValue.arrayUnion(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          if (_model.isLiked == false)
                                            Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20.0,
                                            ),
                                          if (_model.isLiked == true)
                                            Icon(
                                              Icons.favorite_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                        ],
                                      ),
                                      Text(
                                        containerCommentsRecord
                                            .commentLikes.length
                                            .toString(),
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
                            ],
                          ),
                          Text(
                            dateTimeFormat("relative",
                                containerCommentsRecord.commentTime!),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
