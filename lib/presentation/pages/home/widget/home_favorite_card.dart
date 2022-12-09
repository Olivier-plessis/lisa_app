import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

import 'package:lisa_app/presentation/widgets/book/book_poster_widget.dart';

class HomeFavoriteCard extends StatelessWidget {
  const HomeFavoriteCard({
    super.key,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String author;
  final String imagePath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextSpan textSpan = TextSpan(
      text: ' $title ',
    );
    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.rtl,
    )..layout(
        maxWidth: 250,
      );
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.h),
        child: SizedBox(
          height: 124.0.h,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 92.0.h,
                width: size.width - (size.width * .22),
                decoration: BoxDecoration(
                    color: ColorTheme.mainLightColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: ColorTheme.secondaryColor.withOpacity(0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, bottom: 18),
                child: Row(
                  children: [
                    BookPoster(
                      imagePath: imagePath,
                      width: 75,
                      height: 105,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.loose(const Size(210, 200)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              title,
                            ),
                            Text(
                              author,
                              style: const TextStyle(
                                color: ColorTheme.orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
