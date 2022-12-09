import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

class HomeFlexRow extends StatelessWidget {
  const HomeFlexRow(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.child,
      this.height = 215});

  final String title;
  final String subtitle;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: RotatedBox(
            quarterTurns: -1,
            child: RichText(
              maxLines: 2,
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: title,
                    style: TextStyle(
                        fontSize: FontSizeTheme.bodyMedium.toDouble(),
                        fontWeight: FontWeightTheme.light,
                        color: ColorTheme.secondaryColor),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(
                        fontSize: FontSizeTheme.bodyMedium.toDouble(),
                        fontWeight: FontWeightTheme.medium,
                        color: ColorTheme.secondaryColor),
                  ),
                ],
              ),
            ),
          ).paddedL(16.w).paddedV(25.h),
        ),
        Flexible(
          flex: 6,
          child: child,
        )
      ],
    );
  }
}
