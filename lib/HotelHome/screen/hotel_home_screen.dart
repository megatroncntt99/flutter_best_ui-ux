import 'package:flutter/material.dart';
import 'package:flutter_best_ui/HotelHome/components/calendar_popup_view.dart';
import 'package:flutter_best_ui/HotelHome/components/hotel_card.dart';
import 'package:flutter_best_ui/HotelHome/models/hotel_list_data.dart';
import 'package:intl/intl.dart';

import '../hotel_app_theme.dart';
import 'filters_screen.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({Key key}) : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  final ScrollController _scrollController = ScrollController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder<bool>(
          future: getData(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                      spreadRadius: 1.3)
                                ]),
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "London...",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.greenAccent,
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    getTimeDateUI(),
                    Row(
                      children: [
                        Text(
                          "530 hotels found ",
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.sort,
                            color: HotelAppTheme.buildLightTheme().primaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FiltersScreen();
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ...hotelList
                        .asMap()
                        .map<int, Widget>((key, hotelData) {
                          animationController.forward();
                          animation = Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                  curve: Interval(key / hotelList.length, 1,
                                      curve: Curves.fastOutSlowIn),
                                  parent: animationController));
                          return MapEntry(
                              key,
                              HotelCard(
                                hotelListData: hotelData,
                                animation: animation,
                                animationController: animationController,
                              ));
                        })
                        .values
                        .toList()
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              // setState(() {
              //   isDatePopupOpen = true;
              // });
              showDemoDialog(context: context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose date ",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.8)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Number of Rooms",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "1 Room - 2 Adults",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDemoDialog({BuildContext context}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            if (startData != null && endData != null) {
              startDate = startData;
              endDate = endData;
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Explore",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {}),
      ],
    );
  }
}
