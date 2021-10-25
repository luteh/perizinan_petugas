import 'package:flutter/material.dart';

class ColorPalettes {
  const ColorPalettes._();

  static const _primaryValue = 0xff008383;

  static const primary = Color(_primaryValue);
  static const black = Color(0xff313450);
  static const darkGrey = Color(0xff898a8f);
  static const grey = Color(0xff94a5a6);
  static const lightGrey = bgNavigationMenu;
  static const divider = Color(0xffECECEC);
  static const divider2 = Color(0xffB5B5B5);
  static const bgGrey = Color(0xffFBFBFB);
  static const bgGrey2 = Color(0xffF8F8F8);
  static const bgScaffold = Color(0xffF1F1F1);

  static const greyBackground = lightGrey;

  static const green = Color(0xff2B9D21);
  static Color bgGreen50 = const Color(0xffB9FFC4).withOpacity(0.5);
  static Color bgMaroonMenuItem = const Color(0xffFFD0D0);
  static const bgNavigationMenu = Color(0xffF8F4F5);
  static const bgCard = Color(0xffF7F7F7);
  static const bgProductItemMaroon = Color(0xff9E2A3F);
  static Color bgMaroonOp50 = const Color(0xffFFB9C6).withOpacity(0.5);
  static const maroon = Color(0xffA42A40);
  static const maroon2 = Color(0xff9E2439);
  static const maroonDark = Color(0xff4A0B16);
  static const maroonText = Color(0xff9D273D);
  static const bgGreyForm = Color(0xffFCFCFC);
  static const greyForm = Color(0xffE7E7E7);
  static const greyForm2 = Color(0xffEDEDED);
  static const greyFormBorder = Color(0xffCFCFCF);
  static const greyText = Color(0xff858585);
  static Color greyText2 = const Color(0xff404040).withOpacity(0.6);
  static Color greyText3 = const Color(0xff414141);
  static Color greyText4 = const Color(0xff9D9D9D);
  static const greyDark100 = Color(0xff424242);
  static Color grey75 = greyDark100.withOpacity(0.75);
  static Color grey25 = greyDark100.withOpacity(0.25);
  static Color grey50 = greyDark100.withOpacity(0.50);
  static Color blackShadow = Colors.black.withOpacity(0.25);
  static Color shadowCard = const Color(0xff2B2B2B).withOpacity(0.25);

  static Color borderGrey = const Color(0xffAFAFAF);
  static Color bgButtonGrey = const Color(0xff434D53);
  static Color dividerGrey = const Color(0xffBCBCBC);
  static Color dividerGrey2 = const Color(0xff707070);
  static Color textGrey = const Color(0xff434D53);
  static Color textGrey2 = const Color(0xffB1B1B1);
  static Color shadowGrey = const Color(0xff8C847B);
  static Color bgRed = const Color(0xffC10003);
  static Color grey2 = const Color(0xff4E5859);
  static Color statusBarGrey = const Color(0xffA5A5A5);
  static Color darkBlue = const Color(0xff153484);

  static const primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );
}
