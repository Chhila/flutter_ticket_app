import 'package:flutter/material.dart';

// Custom widget that uses LayoutBuilder to create a dynamic horizontal layout
class AppLayoutbuilderWidget extends StatelessWidget {
  final int randomDivider; // Determines the number of child widgets created
  final double width;
  final bool? isColor;
  const AppLayoutbuilderWidget({super.key, required this.randomDivider, this.width = 3, this.isColor});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder provides constraints of the parent widget
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      print("${constraints.constrainWidth()}"); // Log the available width

      // Create a row-like layout with dynamic child widgets
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Even spacing between children
        direction: Axis.horizontal, // Arrange children horizontally
        children: List.generate(
          // Number of children based on available width and randomDivider
          (constraints.constrainWidth() / randomDivider).floor(),
          (index) => SizedBox(
            height: 1, // Fixed width of each child
            width: width, // Fixed height of each child
            child: DecoratedBox(
              decoration: BoxDecoration(color: isColor == null ? Colors.white : Colors.grey.shade300), // White background
            ),
          ),
        ),
      );
    });
  }
}
