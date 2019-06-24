# shareasy

The Original SharEasy

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Custom Changes Made

Changes made to bottom_sheet.dart in Original Flutter Package for text_input_sheet to coerce with keyboard input

    BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      // maxHeight: isScrollControlled
      //   ? constraints.maxHeight
      //   : constraints.maxHeight * 9.0 / 16.0,
      maxHeight: constraints.maxHeight,
    );
  }
