import 'dart:html';

import 'package:admin/models/RecentFile.dart';
import 'package:admin/services/bookings_service.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/booking.dart';

class BookingsTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingsTableState();
}

class _BookingsTableState extends State<BookingsTable> {
  List<Booking> bookingList = [];

  setBookingListState(bookings) {
    print(bookings);
    setState(() {
      bookingList = bookings;
    });
  }

  @override
  void initState() {
    super.initState();
    BookingService().getBookings().then((value) => setBookingListState(value));
  }

  onDeleted() {
    final snackBar = SnackBar(
      content: Text('Booking Deleted!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    BookingService().getBookings().then((value) => setBookingListState(value));
  }

  onApproved() {
    final snackBar = SnackBar(
      content: Text('Booking Approved!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    BookingService().getBookings().then((value) => setBookingListState(value));
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
                bookingList.length,
                (index) => recentFileDataRow(
                    bookingList[index], onDeleted, onApproved),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Booking booking, onDeleted, onApproved) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(booking.event ?? '--'),
            ),
          ],
        ),
      ),
      DataCell(Text(booking.createdAt?.split('T')[0] ?? '')),
      DataCell(Text(booking.user ?? 'Subina')),
      DataCell(Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                BookingService()
                    .deleteBooking(booking.id ?? 0)
                    .then((value) => onApproved());
              },
              child: Text('Approve'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
                onPressed: () {
                  BookingService()
                      .deleteBooking(booking.id ?? 0)
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
