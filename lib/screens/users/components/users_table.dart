import 'dart:html';

import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/User.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({
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
              columnSpacing: 0,
              horizontalMargin: 0,
              columns: [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Phone"),
                ),
                DataColumn(
                  label: Text("Number of Bookings"),
                ),
                DataColumn(
                  label: Text("Action"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoUsers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(User userInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text("${userInfo.fname} ${userInfo.lname}"),
            ),
          ],
        ),
      ),
      DataCell(Text(userInfo.email)),
      DataCell(Text(userInfo.phone)),
      DataCell(Text(userInfo.bookingCount.toString())),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                // TODO
              },
              child: Text('Edit'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
                onPressed: () {
                  // TODO
                },
                child: Text('Delete'),
                style: OutlinedButton.styleFrom(primary: dangerColor)),
          )
        ],
      )),
    ],
  );
}
