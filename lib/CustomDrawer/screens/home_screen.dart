import 'package:flutter/material.dart';
import 'package:flutter_best_ui/CustomDrawer/models/home_list.dart';
import 'package:flutter_best_ui/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool multiple = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Flutter UI",
          style: TextStyle(
            fontSize: 22,
            color: AppTheme.darkText,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                multiple ? Icons.dashboard : Icons.view_agenda,
                color: AppTheme.dark_grey,
              ),
              onPressed: () {
                setState(() {
                  multiple = !multiple;
                });
              })
        ],
      ),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: homeList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: multiple ? 2 : 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  int count = homeList.length;
                  final listData = homeList[index];
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  _controller.forward();
                  return HomeListView(
                    controller: _controller,
                    animation: animation,
                    listData: listData,
                    press: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            listData.navigateScreen,
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          if (index == 1) {
                            return ScaleTransition(
                              child: child,
                              scale: animation,
                            );
                          }
                          if (index == 0) {
                            return RotationTransition(
                                child: child, turns: animation);
                          }

                          return SlideTransition(
                            position: animation.drive(Tween(
                                    begin: Offset(-1, 1.0), end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeInCubic))),
                            child: child,
                          );
                        },
                      ));
                    },
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key key,
    @required AnimationController controller,
    @required this.animation,
    @required this.listData,
    @required this.press,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final Animation<double> animation;
  final HomeList listData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                -50 * (1 - animation.value), 50 * (1 - animation.value), 0),
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.2),
              onTap: press,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                      listData.imagePath,
                    ))),
              ),
            ),
          ),
        );
      },
    );
  }
}
