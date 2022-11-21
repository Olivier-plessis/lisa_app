import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookPoster extends StatelessWidget {
  const BookPoster({
    super.key,
    this.imagePath,
  });
  final String? imagePath;
  static const double width = 90.0;
  static const double height = 125.0;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CachedNetworkImage(
        imageUrl: imagePath!,
        imageBuilder:
            (BuildContext context, ImageProvider<Object> imageProvider) =>
                Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: ColorTheme.secondaryContainerColor,
          highlightColor: ColorTheme.secondaryColor,
          child: Container(
            width: width,
            height: height,
            color: Colors.black,
          ),
        ),
        errorWidget: (BuildContext context, String url, dynamic error) =>
            Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  ColorTheme.secondaryContainerColor,
                  ColorTheme.secondaryColor,
                ],
              )),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                ColorTheme.secondaryContainerColor,
                ColorTheme.secondaryColor,
              ],
            )),
      );
    }
  }
}
