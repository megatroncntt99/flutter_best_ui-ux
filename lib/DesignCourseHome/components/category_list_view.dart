import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/models/category.dart';
import 'package:flutter_best_ui/DesignCourseHome/screens/course_info_screen.dart';

import 'category_view.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int count = categoryList.length;
            Animation<double> animation =
                Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      index / count,
                      1,
                      curve: Curves.fastOutSlowIn,
                    )));

            _controller.forward();

            return CategoryView(
              category: categoryList[index],
              callback: () {
                moveTo(categoryList[index]);
              },
              animation: animation,
              animationController: _controller,
            );
          },
        ));
  }

  void moveTo(Category category) {
    Navigator.push<dynamic>(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CourseInfoScreen(
          category: category,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}
