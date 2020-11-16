import 'package:flutter/widgets.dart';
import 'package:flutter_best_ui/DesignCourseHome/screens/design_course_home_screen.dart';
import 'package:flutter_best_ui/FitnessAppHome/screens/fitness_app_home_screen.dart';
import 'package:flutter_best_ui/HotelHome/screen/hotel_home_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  final Widget navigateScreen;
  final String imagePath;
}

List<HomeList> homeList = [
  HomeList(
    imagePath: 'assets/hotel/hotel_booking.png',
    navigateScreen: HotelHomeScreen(),
  ),
  HomeList(
    imagePath: 'assets/fitness_app/fitness_app.png',
    navigateScreen: FitnessAppHomeScreen(),
  ),
  HomeList(
    imagePath: 'assets/design_course/design_course.png',
    navigateScreen: DesignCourseHomeScreen(),
  ),
];
