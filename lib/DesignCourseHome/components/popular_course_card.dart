import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/models/category.dart';

import '../../hex_color.dart';
import '../design_course_app_theme.dart';

class PopularCourseCard extends StatelessWidget {
  const PopularCourseCard({
    Key key,
    this.callback,
    @required this.category,
    @required this.animationController,
    @required this.animation,
  }) : super(key: key);

  final VoidCallback callback;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform:
                Matrix4.translationValues(0, 100 * (1 - animation.value), 0),
            child: InkWell(
              onTap: callback,
              splashColor: DesignCourseAppTheme.darkText,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      height: 160,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: HexColor('#F8FAFB'),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              category.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.darkerText,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
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
                                Spacer(),
                                Text(
                                  '${category.rating}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18,
                                    letterSpacing: 0.27,
                                    color: DesignCourseAppTheme.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                  size: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 20,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignCourseAppTheme.grey
                                      .withOpacity(0.2),
                                  offset: const Offset(0, -7),
                                  blurRadius: 16.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: AspectRatio(
                              aspectRatio: 1.28,
                              child: Image.asset(
                                category.imagePath,
                              ),
                            ),
                          ),
                        ))
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
