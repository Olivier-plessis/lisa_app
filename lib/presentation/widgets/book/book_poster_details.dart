import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_widget.dart';

class BookPosterDetails extends StatelessWidget {
  const BookPosterDetails({
    super.key,
    required this.imageLink,
    required this.onTapButton,
    this.onTapDelete,
    this.onTapToFavorite,
    this.restoreToFavorite = false,
    this.starToRead = BookStatus.pending,
    this.deleteTo = false,
    required this.buttonText,
    this.deleteButtonLeftPosition = 170.0,
  });

  final String imageLink;
  final VoidCallback? onTapDelete;
  final VoidCallback? onTapToFavorite;
  final BookStatus? starToRead;
  final bool? deleteTo;
  final bool? restoreToFavorite;
  final VoidCallback onTapButton;
  final String buttonText;
  final double deleteButtonLeftPosition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      height: 250.0,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50.0),
            width: MediaQuery.of(context).size.width - 20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              color: ColorTheme.secondaryColor,
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                child: BookPoster(
                  height: 250.0,
                  imagePath: imageLink,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(10)),
                )),
          ),
          if (restoreToFavorite == true && starToRead == BookStatus.pending)
            Positioned(
                left: 110,
                bottom: 20,
                child: InkWell(
                  onTap: onTapToFavorite,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: ColorTheme.darkPurpleColor),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.favorite,
                          color: ColorTheme.mainLightColor,
                        ),
                      ],
                    ),
                  ),
                )),
          if (deleteTo == true && starToRead == BookStatus.pending)
            Positioned(
                left: deleteButtonLeftPosition,
                bottom: 20,
                child: InkWell(
                  onTap: onTapDelete,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: ColorTheme.failureRed),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.delete_outline_outlined,
                          color: ColorTheme.mainLightColor,
                        ),
                      ],
                    ),
                  ),
                )),
          if (starToRead == BookStatus.pending)
            Positioned(
                right: 20,
                bottom: 20,
                child: InkWell(
                  onTap: onTapButton,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: ColorTheme.orangeLightColor),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.play_arrow_outlined,
                          color: ColorTheme.secondaryColor,
                        ),
                        Text(
                          buttonText,
                          style: const TextStyle(
                              color: ColorTheme.secondaryColor, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
