import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecentBookings extends StatelessWidget {
  const RecentBookings({
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
          Text(
            "Recent Bookings",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              minWidth: 600,
              columnSpacing: 0,
              horizontalMargin: 0,
              columns: [
                DataColumn(
                  label: Text("Event Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("User"),
                ),
                DataColumn(
                  label: Text("Action"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentBooking fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(fileInfo.eventName!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.userName!)),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                // TODO
              },
              child: Text('Approve'),
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
