import "package:flutter/material.dart";
import "color_manager.dart";

class TextStyleManager {
  static const headerTextStyle = TextStyle(
    fontFamily: "UbuntuBold",
    fontSize: 20,
    color: Color(ColorManager.slateGrey),
  );

  static const textFieldStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 16,
    color: Color(ColorManager.blueKoi),
  );

  static const darkTextButtonStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 24,
    color: Colors.white,
  );

  static const lightTextButtonStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 24,
    color: Color(ColorManager.slateGrey),
  );

  static const standardTextStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 16,
    color: Colors.black,
  );

  static const subheaderTextStyle = TextStyle(
    fontFamily: "UbuntuBold",
    fontSize: 18,
    color: Color(ColorManager.slateGrey),
  );

  static const seeAllTextStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 12,
    color: Color(ColorManager.blueKoi),
  );

  static const genreButtonDarkTextStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 14,
    color: Colors.black,
  );

  static const genreButtonLightTextStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 14,
    color: Colors.white,
  );

  static const blueKoiTitleMovieTextStyle = TextStyle(
    fontFamily: "UbuntuBold",
    fontSize: 16,
    color: Color(ColorManager.blueKoi),
  );

  static const lightTitleMovieTextStyle = TextStyle(
    fontFamily: "UbuntuBold",
    fontSize: 16,
    color: Colors.white,
  );

  static const releaseDateAndRatingTextStyle = TextStyle(
    fontFamily: "UbuntuRegular",
    fontSize: 14,
    color: Colors.black,
  );
}
