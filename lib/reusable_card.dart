import 'package:flutter/material.dart';

// Step 1: Click the right side of OUTLINE
// Step 2: Choose the widget
// Step 3: Right click the "Extract the Widget"
// Step 4: A StatelessWidget has been generated and replaced all
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  // "final" makes the property usable
  // Set the property and we cannot change again

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // Container #1
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        // Round the corner
        decoration: BoxDecoration(
          color: colour, // 因为BoxDecoration内含color property
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
