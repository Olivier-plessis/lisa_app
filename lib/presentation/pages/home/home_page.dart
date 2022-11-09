import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorTheme.tertiaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'My Books',
                  style: Theme.of(context).textTheme.headline1,
                ).paddedL(48),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text('in progress'),
                      ).paddedL(12),
                    ),
                    Flexible(
                        flex: 6,
                        child: Column(
                          children: [Text('My Book')],
                        ))
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
