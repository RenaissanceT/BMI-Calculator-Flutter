import 'package:flutter/material.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  // Memorize this line of code to understand
  IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        // Add gap between icon and text
        SizedBox(
          // modify the distance between the icon and text
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
