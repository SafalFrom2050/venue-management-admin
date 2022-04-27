import 'dart:html';

import 'package:admin/models/FeedbackInfo.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/User.dart';

class FeedbacksTable extends StatelessWidget {
  const FeedbacksTable({
    Key? key,
  }) : super(key: key);

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
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoFeedbacks[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(FeedbackInfo feedbackInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(feedbackInfo.userName),
            ),
          ],
        ),
      ),
      DataCell(Text(feedbackInfo.email)),
      DataCell(Text(feedbackInfo.phone)),
      DataCell(Text(feedbackInfo.feedback)),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                // TODO
              },
              child: Text('Mark as Read'),
            ),
          )
        ],
      )),
    ],
  );
}
