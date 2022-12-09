import 'package:app_ui/src/theme/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
*  Main theme typography
*
*/

class StyleTheme {
  StyleTheme._();

  static const TextStyle _baseLargeTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.mainFont,
    color: ColorTheme.secondaryColor,
    fontWeight: FontWeightTheme.regular,
  );

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.secondaryFont,
    color: ColorTheme.greyColor,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get headline1 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleVeryLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline2 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline4 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLight.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  /// Default Text Style
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get overline {
    return _baseTextStyle.copyWith(
        fontSize: FontSizeTheme.bodyMedium.sp,
        fontWeight: FontWeightTheme.regular,
        decoration: TextDecoration.underline,
        color: ColorTheme.secondaryColor);
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }
}

/*
*  Dark theme typography
*
*/

class DarkStyleTheme {
  DarkStyleTheme._();

  static const TextStyle _baseLargeTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.mainFont,
    color: ColorTheme.mainLightColor,
    fontWeight: FontWeightTheme.regular,
  );

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: FontFamilyTheme.secondaryFont,
    color: ColorTheme.greyColor,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get headline1 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleVeryLarge.sp,
      fontWeight: FontWeightTheme.medium,
      color: ColorTheme.veryGreyLightColor,
    );
  }

  static TextStyle get headline2 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get headline3 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleMedium.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get headline4 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get headline5 {
    return _baseLargeTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLight.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyRegular.sp,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }

  /// Default Text Style
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium.sp,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get overline {
    return _baseTextStyle.copyWith(
        fontSize: FontSizeTheme.bodyMedium.sp,
        fontWeight: FontWeightTheme.regular,
        decoration: TextDecoration.underline,
        color: ColorTheme.secondaryColor);
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge.sp,
      fontWeight: FontWeightTheme.medium,
    );
  }
}

final TextTheme textTheme = TextTheme(
  headline1: StyleTheme.headline1,
  headline2: StyleTheme.headline2,
  headline3: StyleTheme.headline3,
  headline4: StyleTheme.headline4,
  headline5: StyleTheme.headline5,
  subtitle1: StyleTheme.subtitle1,
  subtitle2: StyleTheme.subtitle2,
  bodyText1: StyleTheme.bodyText1,
  bodyText2: StyleTheme.bodyText2,
  overline: StyleTheme.overline,
  button: StyleTheme.button,
);

final TextTheme darkTextTheme = TextTheme(
  headline1: DarkStyleTheme.headline1,
  headline2: DarkStyleTheme.headline2,
  headline3: DarkStyleTheme.headline3,
  headline4: DarkStyleTheme.headline4,
  headline5: DarkStyleTheme.headline5,
  subtitle1: DarkStyleTheme.subtitle1,
  subtitle2: DarkStyleTheme.subtitle2,
  bodyText1: DarkStyleTheme.bodyText1,
  bodyText2: DarkStyleTheme.bodyText2,
  overline: DarkStyleTheme.overline,
  button: DarkStyleTheme.button,
);
