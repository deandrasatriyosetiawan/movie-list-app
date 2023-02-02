import "package:flutter/material.dart";
import "color_manager.dart";

class BoxDecorationManager {
  static final darkBoxDecoration = BoxDecoration(
    color: const Color(ColorManager.slateGrey),
    borderRadius: BorderRadius.circular(30),
  );

  static final lightBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
      color: const Color(ColorManager.slateGrey),
      strokeAlign: StrokeAlign.outside,
      style: BorderStyle.solid,
    ),
  );

  static BoxDecoration genreButtonBoxDecoration(Color setColor) {
    return BoxDecoration(
      color: setColor,
      borderRadius: BorderRadius.circular(20),
    );
  }

  static BoxDecoration movieBoxDecoration(Color setColor) {
    return BoxDecoration(
      color: setColor,
      borderRadius: BorderRadius.circular(20),
    );
  }

  static final profileInfoBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(0),
    border: Border.all(
      color: const Color(ColorManager.blueKoi),
      strokeAlign: StrokeAlign.outside,
      style: BorderStyle.solid,
    ),
  );
}
