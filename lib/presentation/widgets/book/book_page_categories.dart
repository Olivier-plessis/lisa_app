import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  int index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

class BookPageCategories extends StatelessWidget {
  const BookPageCategories({
    super.key,
    required this.pageCount,
    this.categories,
    this.numberOfPageRead,
    this.isStarted,
    this.onTap,
  });

  final int pageCount;
  final String? categories;
  final String? numberOfPageRead;
  final BookStatus? isStarted;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    List<String>? listOfCategories = [];

    if (categories!.length >= 3) {
      listOfCategories =
          categories?.substring(0, categories?.indexOf(',')).split('/');
    }

    final List<Color> colors = [
      ColorTheme.orangeLightColor,
      ColorTheme.lightPurpleColor,
      ColorTheme.warningYellow
    ];

    return SizedBox(
      height: 68.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    if (isStarted == BookStatus.inProgress)
                      Text('$numberOfPageRead / ',
                          style: textTheme.headline5!
                              .copyWith(color: ColorTheme.secondaryColor)),
                    Text('$pageCount',
                        style: textTheme.headline5!
                            .copyWith(color: ColorTheme.secondaryColor)),
                    Text(' pages ',
                        style: textTheme.subtitle2!
                            .copyWith(color: ColorTheme.bodyTextColor)),
                    if (isStarted == BookStatus.inProgress)
                      InkWell(
                        onTap: onTap,
                        child: const Icon(Icons.edit_outlined,
                            color: ColorTheme.secondaryColor),
                      ),
                  ],
                ),
                const Gap(50.0),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: (categories!.length >= 3)
                      ? Row(
                          children: mapIndexed(listOfCategories!,
                              (int index, String item) {
                          return Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.only(
                                  left: 8, top: 6, bottom: 8, right: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: colors[index]),
                              child: Text('#${item.replaceAll('[', '')}',
                                  style: const TextStyle(
                                      color: ColorTheme.bodyTextColor,
                                      fontSize: 12)));
                        }).toList())
                      : const SizedBox.shrink(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
