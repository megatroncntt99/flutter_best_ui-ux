import 'package:flutter/material.dart';
import 'package:flutter_best_ui/app_theme.dart';

import 'drawer_user_controller.dart';
import 'models/drawer_index.dart';
import 'screens/feedback_screen.dart';
import 'screens/help_screen.dart';
import 'screens/home_screen.dart';
import 'screens/invite_friend.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget _screenView;

  DrawerIndex drawerIndex;
  @override
  void initState() {
    super.initState();
    drawerIndex = DrawerIndex.HOME;
    _screenView = const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: _screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    switch (drawerIndexdata) {
      case DrawerIndex.HOME:
        setState(() {
          _screenView = HomeScreen();
          drawerIndex = DrawerIndex.HOME;
        });

        break;
      case DrawerIndex.Help:
        setState(() {
          _screenView = HelpScreen();
          drawerIndex = DrawerIndex.Help;
        });
        break;
      case DrawerIndex.FeedBack:
        setState(() {
          _screenView = FeedbackScreen();
          drawerIndex = DrawerIndex.FeedBack;
        });
        break;
      case DrawerIndex.Invite:
        setState(() {
          _screenView = InviteFriend();
          drawerIndex = DrawerIndex.Invite;
        });
        break;

      default:
        setState(() {
          _screenView = Scaffold();
        });
    }
  }
}
