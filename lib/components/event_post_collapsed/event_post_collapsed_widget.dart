import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/event_post/event_post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'event_post_collapsed_model.dart';
export 'event_post_collapsed_model.dart';

class EventPostCollapsedWidget extends StatefulWidget {
  const EventPostCollapsedWidget({
    super.key,
    required this.userEvents,
  });

  final EventsRecord? userEvents;

  @override
  State<EventPostCollapsedWidget> createState() =>
      _EventPostCollapsedWidgetState();
}

class _EventPostCollapsedWidgetState extends State<EventPostCollapsedWidget> {
  late EventPostCollapsedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventPostCollapsedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENT_POST_COLLAPSED_EventPostCollapsed_');
      logFirebaseEvent('EventPostCollapsed_update_component_stat');
      _model.numInterested = widget.userEvents!.numInterested;
      _model.isInterested =
          (currentUserDocument?.interestedEvents.toList() ?? [])
                  .contains(widget.userEvents?.reference) ==
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('EVENT_POST_COLLAPSED_Container_1xbjoe4l_');
                  logFirebaseEvent('Container_alert_dialog');
                  await showAlignedDialog(
                    context: context,
                    isGlobal: false,
                    avoidOverflow: true,
                    targetAnchor: const AlignmentDirectional(0.0, 1.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: const AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: EventPostWidget(
                          userEvents: widget.userEvents!,
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.userEvents?.eventName,
                            'Event',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Lexend',
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.userEvents?.eventDescription,
                            'Description',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Wrap(
                          spacing: 18.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.userEvents?.eventLocation,
                                '1501 Broadway, New York, NY 10036',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat("M/d h:mm a",
                                    widget.userEvents?.eventTime),
                                'EventDate',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 5.0)),
                    ),
                  ),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
