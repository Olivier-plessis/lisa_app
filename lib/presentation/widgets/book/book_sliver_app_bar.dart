import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';

class BookSliverAppBar extends StatelessWidget {
  const BookSliverAppBar({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
  });

  final Size size;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: FontSizeTheme.titleLight.toDouble())),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .005),
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: FontSizeTheme.titleLight.toDouble()),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
