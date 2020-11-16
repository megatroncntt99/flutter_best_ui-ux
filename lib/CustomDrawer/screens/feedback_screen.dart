import 'package:flutter/material.dart';

import '../../app_theme.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Image.asset('assets/images/feedbackImage.png'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Your FeedBack',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Give your best time for this moment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          offset: const Offset(4, 4),
                          blurRadius: 8),
                    ],
                  ),
                  constraints:
                      const BoxConstraints(minHeight: 80, maxHeight: 160),
                  child: TextField(
                    maxLines: null,
                    onChanged: (String txt) {},
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontSize: 16,
                      color: AppTheme.dark_grey,
                    ),
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your feedback...'),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 8.0,
                        )
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
