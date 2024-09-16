import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/meal_planner/components/planner_details/planner_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'planner_model.dart';
export 'planner_model.dart';

class PlannerWidget extends StatefulWidget {
  const PlannerWidget({super.key});

  @override
  State<PlannerWidget> createState() => _PlannerWidgetState();
}

class _PlannerWidgetState extends State<PlannerWidget> {
  late PlannerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlannerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.planner = await queryWeeklyPlannerRecordCount(
        queryBuilder: (weeklyPlannerRecord) => weeklyPlannerRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
      );
      if (_model.planner.toString() != '0') {
        setState(() {
          FFAppState().plannerExisting = true;
        });
      } else {
        setState(() {
          FFAppState().plannerExisting = false;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF14181B),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Text(
                'Weekly Planner',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (FFAppState().plannerExisting)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Monday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Tuesday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Wednesday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Thursday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Friday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Saturday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<WeeklyPlannerRecord>>(
                        stream: queryWeeklyPlannerRecord(
                          queryBuilder: (weeklyPlannerRecord) =>
                              weeklyPlannerRecord
                                  .where(
                                    'nameDay',
                                    isEqualTo: 'Sunday',
                                  )
                                  .where(
                                    'userId',
                                    isEqualTo: currentUserUid,
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<WeeklyPlannerRecord>
                              cardWeeklyPlannerRecordList = snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final cardWeeklyPlannerRecord =
                              cardWeeklyPlannerRecordList.isNotEmpty
                                  ? cardWeeklyPlannerRecordList.first
                                  : null;
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      cardWeeklyPlannerRecord?.nameDay,
                                      'Monday',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFFFC300),
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Breakfast',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.breakfastMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Breakfast',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealtime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .breakfastMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.breakfast_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Breakfast',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.breakfastMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.breakfastMealtime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Lunch',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.lunchMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Lunch',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .lunchMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.set_meal,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Lunch',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.lunchMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.lunchMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Snack',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.snackMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Snack',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .snackMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.coffee_sharp,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Snack',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.snackMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.snackMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Meals',
                                              queryParameters: {
                                                'mealType': serializeParam(
                                                  'Dinner',
                                                  ParamType.String,
                                                ),
                                                'nameDay': serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.nameDay,
                                                  ParamType.String,
                                                ),
                                                'plannerReference':
                                                    serializeParam(
                                                  cardWeeklyPlannerRecord
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.25,
                                              children: [
                                                SlidableAction(
                                                  label: 'Details',
                                                  backgroundColor:
                                                      const Color(0xFFFFC300),
                                                  icon: Icons.info,
                                                  onPressed: (_) async {
                                                    if (cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            null &&
                                                        cardWeeklyPlannerRecord
                                                                ?.dinnerMealName !=
                                                            '') {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PlannerDetailsWidget(
                                                                mealType:
                                                                    'Dinner',
                                                                nameDay:
                                                                    cardWeeklyPlannerRecord!
                                                                        .nameDay,
                                                                dateTime:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealTime!,
                                                                mealReference:
                                                                    cardWeeklyPlannerRecord
                                                                        .dinnerMealReference!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Error!'),
                                                            content: const Text(
                                                                'No details available. Add a meal.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.dinner_dining,
                                                color: Color(0xFFFFC300),
                                              ),
                                              title: Text(
                                                'Dinner',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFFFFC300),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                '${cardWeeklyPlannerRecord?.dinnerMealName} - ${dateTimeFormat('M/d h:mm a', cardWeeklyPlannerRecord?.dinnerMealTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: const Icon(
                                                Icons.add,
                                                color: Color(0xFFFFC300),
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              if (!FFAppState().plannerExisting)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          // Planner Monday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Monday',
                                userId: currentUserUid,
                              ));
                          // Planner Tuesday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Tuesday',
                                userId: currentUserUid,
                              ));
                          // Planner Wednesday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Wednesday',
                                userId: currentUserUid,
                              ));
                          // Planner Thursday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Thursday',
                                userId: currentUserUid,
                              ));
                          // Planner Friday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Friday',
                                userId: currentUserUid,
                              ));
                          // Planner Saturday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Saturday',
                                userId: currentUserUid,
                              ));
                          // Planner Sunday

                          await WeeklyPlannerRecord.collection
                              .doc()
                              .set(createWeeklyPlannerRecordData(
                                nameDay: 'Sunday',
                                userId: currentUserUid,
                              ));
                          setState(() {
                            FFAppState().plannerExisting = true;
                          });
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Success'),
                                content: const Text('Weekly Planner created!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        text: 'Create weekly planner',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFFFFC300),
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Color(0xFFFFC300),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
