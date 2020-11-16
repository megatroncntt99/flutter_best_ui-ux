import 'package:flutter/material.dart';
import 'package:flutter_best_ui/DesignCourseHome/models/category.dart';

import '../design_course_app_theme.dart';

class CourseInfoScreen extends StatefulWidget {
  const CourseInfoScreen({Key key, @required this.category}) : super(key: key);

  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();

  final Category category;
}

class _CourseInfoScreenState extends State<CourseInfoScreen>
    with SingleTickerProviderStateMixin {
  Category get category => widget.category;

  AnimationController _controller;
  Animation<double> animation;
  final double infoHeight = 364.0;

  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    setData();
  }

  Future setData() async {
    _controller.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double tempHeight = size.height - (size.width / 1.2) + 24.0;
    return Scaffold(
      backgroundColor: DesignCourseAppTheme.nearlyWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: (size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: infoHeight,
                      maxHeight:
                          tempHeight > infoHeight ? tempHeight : infoHeight),
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: DesignCourseAppTheme.grey.withOpacity(0.2),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                      color: DesignCourseAppTheme.nearlyWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            category.title,
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
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${category.money}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.nearlyBlue,
                              ),
                            ),
                            Spacer(),
                            Text("\$${category.rating}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 22,
                                  letterSpacing: 0.27,
                                  color: DesignCourseAppTheme.grey,
                                )),
                            Icon(
                              Icons.star,
                              color: DesignCourseAppTheme.nearlyBlue,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: Row(
                            children: [
                              getTimeBoxUI("24", 'Class'),
                              getTimeBoxUI("2hours", "Time"),
                              getTimeBoxUI("24", "Seat"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity2,
                            child: Text(
                              'Lorem ipsum is simply dummy text of printing & typesetting industry, Lorem ipsum is simply dummy text of printing & typesetting industry.',
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                letterSpacing: 0.27,
                                color: DesignCourseAppTheme.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity3,
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: DesignCourseAppTheme.nearlyWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,
                                      color: DesignCourseAppTheme.grey
                                          .withOpacity(0.2)),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: DesignCourseAppTheme.nearlyBlue,
                                  size: 32,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: DesignCourseAppTheme.nearlyBlue,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: DesignCourseAppTheme.nearlyBlue
                                              .withOpacity(0.5),
                                          offset: const Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Text(
                                    "Join Course",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      letterSpacing: 0.0,
                                      color: DesignCourseAppTheme.nearlyWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).padding.bottom,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 50,
              right: 50,
              child: ScaleTransition(
                scale: animation,
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: DesignCourseAppTheme.nearlyBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: DesignCourseAppTheme.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.nearlyBlue,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
