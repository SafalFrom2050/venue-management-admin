import 'package:admin/responsive.dart';
import 'package:admin/screens/events/components/recent_events.dart';
import 'package:admin/screens/users/components/users_table.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/title.dart';

class UsersScreen extends StatelessWidget {
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
                      UsersTable(),
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
