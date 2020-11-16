import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/models/category.dart';

import '../../hex_color.dart';
import '../design_course_app_theme.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key key,
    @required this.callback,
    @required this.category,
    this.animationController,
    this.animation,
  }) : super(key: key);
  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform:
                Matrix4.translationValues(100 * (1 - animation.value), 0, 0),
            child: InkWell(
              onTap: callback,
              highlightColor: DesignCourseAppTheme.darkText,
              child: Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: size.width * 0.8 - 50,
                        decoration: BoxDecoration(
                            color: HexColor('#F8FAFB'),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            const SizedBox(width: 50 + 24.0),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      category.title,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: 0.27,
                                        color: DesignCourseAppTheme.darkerText,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${category.lessonCount} lesson',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 12,
                                            letterSpacing: 0.27,
                                            color: DesignCourseAppTheme.grey,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '${category.rating}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 18,
                                                  letterSpacing: 0.27,
                                                  color:
                                                      DesignCourseAppTheme.grey,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: DesignCourseAppTheme
                                                    .nearlyBlue,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, bottom: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '\$${category.money}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.27,
                                            color:
                                                DesignCourseAppTheme.nearlyBlue,
                                          ),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: DesignCourseAppTheme
                                                  .nearlyBlue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(
                                            Icons.add,
                                            color: DesignCourseAppTheme
                                                .nearlyWhite,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      bottom: 20,
                      left: 10,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage(category.imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
