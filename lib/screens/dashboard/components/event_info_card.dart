import 'package:admin/models/RecentEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class EventInfoCard extends StatelessWidget {
  const EventInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final RecentEventInfo info;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            color: info.color,
            capacity: info.capacity,
            attendees: info.attendees,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.date} ",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine(
      {Key? key,
      this.color = primaryColor,
      required this.attendees,
      required this.capacity})
      : super(key: key);

  final Color? color;
  final double? attendees;
  final double? capacity;

  @override
  Widget build(BuildContext context) {
    double percentage = (attendees! / capacity!) * 100;
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 12.0),
            child: Tooltip(
              message: "Maximum $capacity",
              child: Text(
                "$attendees Attendees",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white60, fontSize: 10),
              ),
            )),
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
