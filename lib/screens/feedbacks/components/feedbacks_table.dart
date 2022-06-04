import 'dart:html';

import 'package:admin/models/Feedback.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:admin/services/feedback_service.dart';
import 'package:admin/services/feedback_service.dart';
import 'package:admin/services/feedback_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/User.dart';

class FeedbacksTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedbacksTableState();
}

class _FeedbacksTableState extends State<FeedbacksTable> {
  List<FeedbackInfo> feedbackList = [];

  setFeedbackListState(feedbacks) {
    print(feedbacks);
    setState(() {
      feedbackList = feedbacks;
    });
  }

  @override
  void initState() {
    super.initState();
    FeedbackService()
        .getFeedbacks()
        .then((value) => setFeedbackListState(value));
  }

  onDeleted() {
    final snackBar = SnackBar(
      content: Text('Feedback Marked as Read!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    FeedbackService()
        .getFeedbacks()
        .then((value) => setFeedbackListState(value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              minWidth: 600,
              columnSpacing: 20,
              dataRowHeight: 200,
              horizontalMargin: 0,
              columns: [
                DataColumn(
                  label: Text("User Name"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Phone"),
                ),
                DataColumn(
                  label: Text("Feedback"),
                ),
                DataColumn(
                  label: Text("Action"),
                ),
              ],
              rows: List.generate(
                feedbackList.length,
                (index) => recentFileDataRow(feedbackList[index], onDeleted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(FeedbackInfo feedbackInfo, onDeleted) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(feedbackInfo.username ?? "subina1"),
            ),
          ],
        ),
      ),
      DataCell(Text(feedbackInfo.email ?? "subina1@gmail.com")),
      DataCell(Text(feedbackInfo.phone ?? "--")),
      DataCell(Text(feedbackInfo.feedback ?? "Good app!")),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                FeedbackService()
                    .deleteFeedback(feedbackInfo.id ?? 0)
                    .then((value) => onDeleted());
              },
              child: Text('Mark as Read'),
            ),
          )
        ],
      )),
    ],
  );
}
