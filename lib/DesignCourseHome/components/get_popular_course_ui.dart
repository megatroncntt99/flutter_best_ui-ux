import 'package:flutter/material.dart';

import '../design_course_app_theme.dart';
import 'popular_course_list_view.dart';

class GetPopularCourseUI extends StatelessWidget {
  const GetPopularCourseUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: PopularCourseListView()),
        ],
      ),
    );
  }
}
