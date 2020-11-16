import 'package:flutter/material.dart';
import 'package:flutter_best_ui/HotelHome/models/hotel_list_data.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    Key key,
    @required this.hotelListData,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final HotelListData hotelListData;
  final AnimationController animationController;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        
        return AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: animation.value,
          child: Transform(
            transform:
                Matrix4.translationValues(0, (100 * (1 - animation.value)), 0),
            child: AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      child: Image.asset(
                        hotelListData.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotelListData.titleTxt,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      hotelListData.subTxt + " ",
                                    ),
                                    Icon(
                                      Icons.place,
                                      color: Colors.greenAccent,
                                    ),
                                    Text("${hotelListData.dist} km to city"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SmoothStarRating(
                                      borderColor: Colors.greenAccent,
                                      color: Colors.greenAccent,
                                      rating: hotelListData.rating,
                                    ),
                                    Text("  ${hotelListData.reviews} Reviews"),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "\$${hotelListData.perNight}\n",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "/per night",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    )
                                  ]),
                            )
                          ],
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
