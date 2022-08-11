import 'dart:html';

import 'package:admin/services/participations_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/participation.dart';

class ParticipationsTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParticipationsTableState();
}

class _ParticipationsTableState extends State<ParticipationsTable> {
  List<Participation> participationList = [];

  setBookingListState(participations) {
    print(participations);
    setState(() {
      participationList = participations;
    });
  }

  @override
  void initState() {
    super.initState();
    ParticipationService().getParticipations().then((value) => setBookingListState(value));
  }

  onDeleted() {
    final snackBar = SnackBar(
      content: Text('Participation Deleted!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    ParticipationService().getParticipations().then((value) => setBookingListState(value));
  }

  onApproved() {
    final snackBar = SnackBar(
      content: Text('Participation Approved!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    ParticipationService().getParticipations().then((value) => setBookingListState(value));
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
                participationList.length,
                (index) => recentFileDataRow(
                    participationList[index], onDeleted, onApproved),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Participation participation, onDeleted, onApproved) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(participation.event ?? '--'),
            ),
          ],
        ),
      ),
      DataCell(Text(participation.createdAt?.split('T')[0] ?? '')),
      DataCell(Text(participation.user ?? 'Subina')),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                ParticipationService()
                    .deleteParticipation(participation.id ?? 0)
                    .then((value) => onApproved());
              },
              child: Text('Approve'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
                onPressed: () {
                  ParticipationService()
                      .deleteParticipation(participation.id ?? 0)
                      .then((value) => onDeleted());
                },
                child: Text('Delete'),
                style: OutlinedButton.styleFrom(primary: dangerColor)),
          )
        ],
      )),
    ],
  );
}
