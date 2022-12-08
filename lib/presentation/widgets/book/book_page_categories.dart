import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class BookPageCategories extends StatelessWidget {
  const BookPageCategories({
    super.key,
    required this.pageCount,
    required this.categories,
    this.numberOfPageRead,
    this.isStarted = false,
    this.onTap,
  });

  final int pageCount;
  final String categories;
  final String? numberOfPageRead;
  final bool? isStarted;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final List<String> split = categories.split('/');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };

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
                  children: [
                    if (isStarted!)
                      Text('$numberOfPageRead / ',
                          style: textTheme.headline5!
                              .copyWith(color: ColorTheme.secondaryColor)),
                    Text('$pageCount',
                        style: textTheme.headline5!
                            .copyWith(color: ColorTheme.secondaryColor)),
                    Text(' pages ',
                        style: textTheme.subtitle2!
                            .copyWith(color: ColorTheme.bodyTextColor)),
                    if (isStarted!)
                      InkWell(
                        onTap: onTap,
                        child: Icon(Icons.edit_outlined,
                            color: ColorTheme.secondaryColor),
                      ),
                  ],
                ),
                const Gap(50.0),
                if (categories.isNotEmpty && categories.length != 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 6, bottom: 8, right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: ColorTheme.orangeLightColor),
                            child: Text('#${values[0]}',
                                style: const TextStyle(
                                    color: ColorTheme.bodyTextColor,
                                    fontSize: 12))),
                        const Gap(10.0),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 6, bottom: 8, right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: ColorTheme.lightPurpleColor),
                            child: Text('#${values[1]}',
                                style: const TextStyle(
                                    color: ColorTheme.bodyTextColor,
                                    fontSize: 12))),
                        const Gap(10.0),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 6, bottom: 8, right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: ColorTheme.warningYellow),
                            child: Text('#${values[2]}',
                                style: const TextStyle(
                                    color: ColorTheme.bodyTextColor,
                                    fontSize: 12))),
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
