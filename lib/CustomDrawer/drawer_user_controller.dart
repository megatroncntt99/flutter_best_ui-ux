import 'package:flutter/material.dart';
import 'package:flutter_best_ui/app_theme.dart';

import 'home_drawer.dart';
import 'models/drawer_index.dart';

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    Key key,
    this.drawerWidth = 250,
    this.onDrawerCall,
    this.screenView,
    this.drawerIsOpen,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuView,
    this.screenIndex,
  }) : super(key: key);
  final double drawerWidth;
  final Function(DrawerIndex) onDrawerCall;
  final Widget screenView;
  final Function(bool) drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget menuView;
  final DrawerIndex screenIndex;

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  AnimationController iconAnimationController, animationController;
  ScrollController scrollController;
  double scrolloffset = 0.0;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));

    iconAnimationController..animateTo(1, curve: Curves.fastOutSlowIn);

    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);

    scrollController
      ..addListener(() {
        if (scrollController.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(() {
              scrolloffset = 1.0;
              try {
                widget.drawerIsOpen(true);
              } catch (_) {}
            });
          }
          iconAnimationController.animateTo(0.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else if (scrollController.offset > 0 &&
            scrollController.offset < widget.drawerWidth.floor()) {
          iconAnimationController.animateTo(
              (scrollController.offset * 100 / (widget.drawerWidth)) / 100,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else {
          if (scrolloffset != 0.0) {
            setState(() {
              scrolloffset = 0.0;
              try {
                widget.drawerIsOpen(false);
              } catch (_) {}
            });
          }
          iconAnimationController.animateTo(1.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        }
      });
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitState());
  }

  Future<bool> getInitState() async {
    scrollController.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    iconAnimationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          height: size.height,
          width: size.width + widget.drawerWidth,
          child: Row(
            children: [
              Container(
                width: widget.drawerWidth,
                height: size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          scrollController.offset, 0, 0),
                      child: HomeDrawer(
                        screenIndex: widget.screenIndex == null
                            ? DrawerIndex.HOME
                            : widget.screenIndex,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          try {
                            widget.onDrawerCall(indexType);
                          } catch (e) {}
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.6), blurRadius: 24),
                  ],
                ),
                child: Stack(
                  children: [
                    IgnorePointer(
                      ignoring: scrolloffset == 1,
                      child: widget.screenView,
                    ),
                    if (scrolloffset == 1.0)
                      InkWell(
                        onTap: () {
                          onDrawerClick();
                        },
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 8, left: 8),
                      child: SizedBox(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
                            child: Center(
                              // if you use your own menu view UI you add form initialization
                              child: widget.menuView != null
                                  ? widget.menuView
                                  : AnimatedIcon(
                                      icon: widget.animatedIconData != null
                                          ? widget.animatedIconData
                                          : AnimatedIcons.arrow_menu,
                                      progress: iconAnimationController),
                            ),
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              onDrawerClick();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer

    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
