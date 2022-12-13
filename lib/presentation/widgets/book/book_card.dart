import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

import 'package:lisa_app/presentation/widgets/book/book_poster_widget.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
    required this.title,
    required this.auth,
    this.pressDetail,
    this.watchDetail = false,
    required this.pressRead,
    this.buttonLabel = 'Read',
    this.textWidth = 200,
    this.positionActionButton = 37,
    this.isStarted,
    this.percentage = '0',
    this.numberOfPageRead = 0,
  });

  final String image;
  final String title;
  final String auth;
  final bool? watchDetail;
  final Function()? pressDetail;
  final Function() pressRead;
  final String? buttonLabel;
  final double textWidth;
  final double positionActionButton;
  final BookStatus? isStarted;
  final String? percentage;
  final int? numberOfPageRead;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 151,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 33,
                    color: ColorTheme.kShadowColor.withOpacity(.84),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 33,
                      color: ColorTheme.kShadowColor.withOpacity(.84),
                    ),
                  ],
                ),
                child: BookPoster(
                  imagePath: image,
                )),
          ),
          Positioned(
            top: 45,
            left: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (auth.isNotEmpty) ATextHeadlineSix(content: auth),
                  SizedBox(
                    width: textWidth,
                    height: 55,
                    child: Text(
                      title,
                      style: textTheme.headline5!
                          .copyWith(color: ColorTheme.secondaryColor),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isStarted == BookStatus.inProgress)
            Positioned(
              top: 55,
              right: 15,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorTheme.mainGreenColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 5,
                      color: ColorTheme.kShadowColor.withOpacity(.84),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            top: 100,
            child: SizedBox(
              height: 85,
              width: MediaQuery.of(context).size.width - positionActionButton.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      if (numberOfPageRead != 0)
                        Container(
                          width: 120,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(percentage!,
                              style: TextStyle(
                                fontSize: FontSizeTheme.bodyRegular.sp,
                              )),
                        ),
                      if (watchDetail == true)
                        GestureDetector(
                          onTap: pressDetail,
                          child: Container(
                            width: 120,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: const Text('Details'),
                          ),
                        )
                      else if (numberOfPageRead != 0)
                        SizedBox(
                          width: 20.0.w,
                        )
                      else
                        SizedBox(
                          width: 120.0.w,
                        ),
                      Expanded(
                        child: MButtonTwoSideRounded(
                          text: buttonLabel!,
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
