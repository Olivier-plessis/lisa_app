import 'package:app_ui/src/theme/colors.dart';
import 'package:app_ui/src/widget/loader/bottom_sheet_loader/staggered_dots_wave.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetLoader {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 1,
          minChildSize: 0.25,
          builder: (BuildContext context, ScrollController scrollController) {
            return Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                StaggeredDotsWave(
                  color: ColorTheme.secondaryColor,
                  size: 100.r,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
