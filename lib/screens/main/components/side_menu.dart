import 'package:admin/constants.dart';
import 'package:admin/screens/bookings/bookings_screen.dart';
import 'package:admin/screens/feedbacks/feedbacks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../dashboard/dashboard_screen.dart';
import '../../events/events_screen.dart';
import '../../participations/participations_screen.dart';
import '../../users/users_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key, this.onChangeScreen}) : super(key: key);

  final Function? onChangeScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            margin: EdgeInsets.all(24.0),
            child: Text('Venue Management System',
                style: TextStyle(color: Colors.white70, fontSize: 18)),
          )),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              onChangeScreen!(DashboardScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Events",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              onChangeScreen!(EventsScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Bookings",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onChangeScreen!(BookingsScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Participation",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onChangeScreen!(ParticipationScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Users",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onChangeScreen!(UsersScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Feedbacks",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onChangeScreen!(FeedbacksScreen());
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Logout",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onChangeScreen!(DashboardScreen());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
