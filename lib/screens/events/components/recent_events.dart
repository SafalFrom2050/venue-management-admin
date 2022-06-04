import 'package:admin/models/event.dart';
import 'package:admin/services/events_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EventsTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventsTableState();
}

class _EventsTableState extends State<EventsTable> {
  List<Event> eventList = [];

  setEventListState(events) {
    print(events);
    setState(() {
      eventList = events;
    });
  }

  @override
  void initState() {
    super.initState();
    EventService().getEvents().then((value) => setEventListState(value));
  }

  onDeleted() {
    final snackBar = SnackBar(
      content: Text('Event Deleted!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    EventService().getEvents().then((value) => setEventListState(value));
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
                eventList.length,
                (index) => recentFileDataRow(eventList[index], onDeleted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Event event, onDeleted) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(event.title),
            ),
          ],
        ),
      ),
      DataCell(Text(event.createdAt.split("T")[0])),
      DataCell(Text(event.photographer)),
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
                  EventService()
                      .deleteEvent(event.id)
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
