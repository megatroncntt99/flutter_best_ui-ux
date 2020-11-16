import 'package:flutter/material.dart';

import '../design_course_app_theme.dart';
import 'category_list_view.dart';

class GetCategoryUI extends StatefulWidget {
  GetCategoryUI({Key key}) : super(key: key);

  @override
  _GetCategoryUIState createState() => _GetCategoryUIState();
}

class _GetCategoryUIState extends State<GetCategoryUI> {
  List<String> categoryType = ["UI/UX", "Coding", "Basic UI"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          height: 60,
          child: ListView.builder(
            itemCount: categoryType.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCategoryCard(index);
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(),
      ],
    );
  }

  Widget buildCategoryCard(int index) {
    return GestureDetector(
      onTap: () {
        this.setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: selectIndex == index ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2,
            color: Colors.blue,
          ),
        ),
        child: Text(
          categoryType[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.27,
            color: selectIndex == index
                ? DesignCourseAppTheme.nearlyWhite
                : DesignCourseAppTheme.nearlyBlue,
          ),
        ),
      ),
    );
  }
}
