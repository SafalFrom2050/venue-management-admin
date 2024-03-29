import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/recent_events.dart';
import 'components/title.dart';

class ParticipationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            TitleWithButton(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      ParticipationsTable(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
