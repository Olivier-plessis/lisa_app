import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_widget.dart';

class HomeReadingCard extends StatelessWidget {
  const HomeReadingCard({
    super.key,
    required this.image,
    required this.title,
    required this.auth,
    required this.pressRead,
  });
  final String image;
  final String title;
  final String auth;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, top: 10.h, bottom: 0.h),
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 12.h,
            left: 0,
            right: 0,
            child: Container(
              height: 201,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
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
            left: 20,
            child: BookPoster(
              imagePath: image,
            ),
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: const <Widget>[Text('85%')],
            ),
          ),
          Positioned(
            top: 130,
            child: SizedBox(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$title\n',
                            style: TextStyle(
                                fontSize: FontSizeTheme.bodyMedium.toDouble(),
                                fontWeight: FontWeight.bold,
                                color: ColorTheme.secondaryColor),
                          ),
                          TextSpan(
                            text: auth,
                            style: const TextStyle(
                              color: ColorTheme.orangeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 70.0,
                      ),
                      Expanded(
                        child: MButtonTwoSideRounded(
                          text: 'Read',
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
