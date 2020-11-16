import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/components/popular_course_card.dart';
import 'package:flutter_best_ui/DesignCourseHome/models/category.dart';
import 'package:flutter_best_ui/DesignCourseHome/screens/course_info_screen.dart';

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView({
    Key key,
  }) : super(key: key);

  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with SingleTickerProviderStateMixin {
  Future<bool> getData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return true;
  }

  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: popularCourseList.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 32.0,
              crossAxisSpacing: 32.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              int count = popularCourseList.length;
              Animation<double> animation =
                  Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                      parent: animationController,
                      curve: Interval(
                        index / count,
                        1,
                        curve: Curves.fastOutSlowIn,
                      )));
              animationController.forward();
              return PopularCourseCard(
                category: popularCourseList[index],
                callback: () {
                  moveTo(popularCourseList[index]);
                },
                animation: animation,
                animationController: animationController,
              );
            },
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void moveTo(Category category) {
    Navigator.push<dynamic>(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CourseInfoScreen(category: category),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
