import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:easy_localization/easy_localization.dart';

class BookHeader extends StatelessWidget {
  const BookHeader(
      {super.key,
      required this.title,
      required this.authors,
      required this.publisher,
      required this.publishedDate});

  final String title;
  final String authors;
  final String publisher;
  final String publishedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10.0),
          ATextHeadlineThree(content: title),
          Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: authors,
                    style: textTheme.subtitle2!
                        .copyWith(color: ColorTheme.orangeColor)),
              ])),
            ],
          ),
          const Gap(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(
                    text: 'Published from ', style: TextStyle(fontSize: 10)),
                TextSpan(
                    text: publisher,
                    style: const TextStyle(
                        fontSize: 10, color: ColorTheme.bodyTextColor)),
              ])),
              if (DateTime.tryParse(publishedDate) != null)
                Text(DateFormat.yMMMd().format(DateTime.parse(publishedDate)),
                    style: const TextStyle(fontSize: 10))
            ],
          ),
        ],
      ),
    );
  }
}
