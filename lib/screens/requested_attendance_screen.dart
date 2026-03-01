import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/providers/attendance_provider.dart';
import 'package:piehme_cup_flutter/states/empty_state.dart';
import 'package:piehme_cup_flutter/states/loading_state.dart';
import 'package:piehme_cup_flutter/themes/gradients_extension.dart';
import 'package:piehme_cup_flutter/themes/main_colors_extension.dart';
import 'package:piehme_cup_flutter/themes/states_colors_extension.dart';
import 'package:piehme_cup_flutter/widgets/animated_list_item.dart';
import 'package:piehme_cup_flutter/widgets/header.dart';
import 'package:piehme_cup_flutter/widgets/requested_attendance_listitem.dart';
import 'package:provider/provider.dart';

import '../dialogs/attendance_dialog.dart';

class RequestedAttendance extends StatefulWidget {
  const RequestedAttendance({super.key});

  @override
  State<RequestedAttendance> createState() => _RequestedAttendanceState();
}

class _RequestedAttendanceState extends State<RequestedAttendance> {
  @override
  Widget build(BuildContext context) {
    final mainColor = Theme.of(
      context,
    ).extension<StatesColorsExtension>()!.mainColor;
    final topGradient = Theme.of(
      context,
    ).extension<MainColorsExtension>()!.topGradient;
    
    return Consumer<AttendanceProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: topGradient,
          toolbarHeight: 0,
          elevation: 0,
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: MediaQuery.heightOf(context)*0.08),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: mainColor.withAlpha(153),
            shape: BoxShape.circle,
            border: Border.all(
              color: mainColor.withAlpha(77),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(77),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.white.withAlpha(26),
                blurRadius: 5,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () => showAttendanceDialog(
              context: context,
            ),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: Theme.of(
              context,
            ).extension<GradientsExtension>()!.attendanceList, begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 26),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        topGradient,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hodour',
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Header(),
                      ],
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (provider.isLoadingRequests &&
                      provider.requestedList.isEmpty) {
                    return _buildLoadingState();
                  }
                  return _buildRequestedAttendanceList(provider, mainColor);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildRequestedAttendanceList(AttendanceProvider provider, Color mainColor) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => provider.loadRequestedAttendances(),
        color: Colors.black,
        backgroundColor: mainColor,
        child: provider.requestedList.isEmpty
            ? CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _buildEmptyState()),
                ],
              )
            : ListView.builder(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 70),
                itemCount: provider.requestedList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.zero,
                    child: AnimatedListItem(
                      index: index,
                      child: RequestedAttendanceListItem(
                          requestedAttendance: provider.requestedList[index]),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return LoadingState(
        iconData: Icons.church,
        title: 'Loading Requests...',
        subtitle: 'Getting your requests ready');
  }

  Widget _buildEmptyState() {
    return EmptyState(
        iconData: Icons.church,
        title: 'No Attendance Requested',
        subtitle: 'Start submitting your attendance');
  }
}
