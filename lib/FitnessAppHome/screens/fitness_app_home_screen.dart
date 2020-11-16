import 'package:flutter/material.dart';
import 'package:flutter_best_ui/FitnessAppHome/components/bottom_bar_view.dart';
import 'package:flutter_best_ui/FitnessAppHome/fintness_app_theme.dart';
import 'package:flutter_best_ui/FitnessAppHome/models/tabIcon_data.dart';
import 'package:flutter_best_ui/FitnessAppHome/screens/training_screen.dart';

import 'my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({Key key}) : super(key: key);

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
    child: Center(
      child: Text("Loading..."),
    ),
  );

  @override
  void initState() {
    super.initState();
    tabIconsList.forEach((element) {
      element.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    tabBody = MyDiaryScreen(
      animationController: animationController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessAppTheme.background,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                tabBody,
                bottombar(),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget bottombar() {
    return Column(
      children: [
        Expanded(child: SizedBox()),
        BottomBarView(
          tabIconData: tabIconsList,
          changeIndex: (index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = MyDiaryScreen(
                    animationController: animationController,
                  );
                });
              });
            } else if (index == 1 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = TrainingScreen(
                    animationController: animationController,
                  );
                });
              });
            }
          },
          addClick: () {
            print("add");
          },
        ),
      ],
    );
  }
}
