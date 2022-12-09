import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widget/shimmer/placeholders.dart';
import 'package:flutter/material.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorTheme.secondaryColor,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const BannerPlaceholder(),
              const TitlePlaceholder(width: double.infinity),
              const Gap(16.0),
              const ContentPlaceholder(
                lineType: ContentLineType.threeLines,
              ),
              const Gap(16.0),
              TitlePlaceholder(width: ScreenUtil().setWidth(200.0)),
              const Gap(16.0),
              const ContentPlaceholder(
                lineType: ContentLineType.twoLines,
              ),
              const Gap(16.0),
              TitlePlaceholder(width: ScreenUtil().setWidth(200.0)),
              const Gap(16.0),
              const ContentPlaceholder(
                lineType: ContentLineType.twoLines,
              ),
            ],
          ),
        ));
  }
}
