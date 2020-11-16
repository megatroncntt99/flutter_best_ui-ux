import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/components/get_category_uI.dart';
import 'package:flutter_best_ui/DesignCourseHome/components/get_popular_course_ui.dart';

import '../../hex_color.dart';
import '../design_course_app_theme.dart';

class DesignCourseHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DesignCourseAppTheme.nearlyWhite,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            SizedBox(height: 20),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getSearchBarUI(context),
                      GetCategoryUI(),
                      Expanded(child: GetPopularCourseUI()),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSearchBarUI(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: HexColor('#F8FAFB'),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(left: 20),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search for course',
          border: InputBorder.none,
          helperStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: HexColor('#B9BABC'),
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.2,
            color: HexColor('#B9BABC'),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: HexColor('#B9BABC'),
            size: 32,
          ),
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose your",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.2,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
              Text(
                "Design Couurse",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.darkerText,
                ),
              ),
            ],
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset(
              "assets/design_course/userImage.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
