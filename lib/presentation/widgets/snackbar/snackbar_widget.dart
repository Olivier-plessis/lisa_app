import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lisa_app/generated/resources.dart';
import 'package:lisa_app/presentation/widgets/snackbar/content_type.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({
    Key? key,
    this.color,
    required this.title,
    required this.message,
    required this.contentType,
  }) : super(key: key);

  final String title;

  /// message String is the body message which shows only 2 lines at max
  final String message;

  /// `optional` color of the SnackBar body
  final Color? color;

  /// contentType will reflect the overall theme of SnackBar:
  /// failure, success, help, warning
  final ContentType contentType;

  @override
  Widget build(BuildContext context) {
    /// For reflecting different color shades in the SnackBar
    final HSLColor hsl = HSLColor.fromColor(color ?? contentType.color!);
    final HSLColor hslDark =
        hsl.withLightness((hsl.lightness - 0.14).clamp(0.0, 1.0));

    return Row(
      children: <Widget>[
        SizedBox(
          width: ScreenUtil().screenWidth * 0.02,
        ),
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              /// SnackBar Body
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().screenWidth * 0.05,
                  vertical: ScreenUtil().screenHeight * 0.015,
                ),
                height: ScreenUtil().screenHeight * 0.12,
                decoration: BoxDecoration(
                  color: color ?? contentType.color,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Row(
                  children: <Widget>[
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: ScreenUtil().screenHeight * 0.025,
                                  color: ColorTheme.mainLightColor,
                                ),
                              ),
                              InkWell(
                                onTap: () => ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar(),
                                child: SvgPicture.asset(
                                  Images.svgFailure,
                                  height: ScreenUtil().screenHeight * 0.022,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            message,
                            style: TextStyle(
                              fontSize: ScreenUtil().screenHeight * 0.017,
                              color: ColorTheme.mainLightColor,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: -ScreenUtil().screenHeight * 0.02,
                left: ScreenUtil().screenWidth * 0.02,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      Images.svgBack,
                      height: ScreenUtil().screenHeight * 0.06,
                      color: hslDark.toColor(),
                    ),
                    Positioned(
                      top: ScreenUtil().screenHeight * 0.015,
                      child: SvgPicture.asset(
                        assetSVG(contentType),
                        height: ScreenUtil().screenHeight * 0.022,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: ScreenUtil().screenWidth * 0.02,
        ),
      ],
    );
  }

  /// Reflecting proper icon based on the contentType
  String assetSVG(ContentType contentType) {
    if (contentType == ContentType.failure) {
      /// failure will show `CROSS`
      return Images.svgFailure;
    } else if (contentType == ContentType.success) {
      /// success will show `CHECK`
      return Images.svgSuccess;
    } else if (contentType == ContentType.warning) {
      /// warning will show `EXCLAMATION`
      return Images.svgWarning;
    } else if (contentType == ContentType.help) {
      /// help will show `QUESTION MARK`
      return Images.svgHelp;
    } else {
      return Images.svgFailure;
    }
  }
}
