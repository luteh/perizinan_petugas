import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:perizinan_petugas/core/style/sizes.dart';

import 'color_palettes.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'DMSans',
    brightness: Brightness.light,
    primaryColor: ColorPalettes.primary,
    dividerColor: ColorPalettes.divider,
    primarySwatch: ColorPalettes.primarySwatch,
    scaffoldBackgroundColor: ColorPalettes.bgScaffold,
    // tabBarTheme: TabBarTheme(
    //   indicator: BoxDecoration(
    //     color: ColorPalettes.primary,
    //   ),
    //   unselectedLabelColor: ColorPalettes.primary
    // ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: Sizes.sp18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
