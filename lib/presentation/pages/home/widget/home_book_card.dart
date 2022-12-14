import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_widget.dart';

class SmallBookCard extends StatelessWidget {
  const SmallBookCard({
    super.key,
    required this.image,
    required this.pressRead,
  });
  final String image;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, top: 10.h, bottom: 0.h),
      width: 152,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 12.h,
            left: 0,
            right: 0,
            child: Container(
              height: 164,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(0, 6),
                    blurRadius: 9,
                    color: ColorTheme.kShadowColor.withOpacity(.94),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: BookPoster(
              imagePath: image,
            ),
          ),
          Positioned(
            top: 80.0.h,
            child: SizedBox(
              height: 85,
              width: 152,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 60.0.w,
                      ),
                      Expanded(
                        child: MButtonTwoSideRounded(
                          text: 'Detail',
                          press: pressRead,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
