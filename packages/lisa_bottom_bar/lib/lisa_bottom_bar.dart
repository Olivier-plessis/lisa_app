library lisa_bottom_bar;

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LisaBottomNavigation extends StatelessWidget {
  const LisaBottomNavigation({
    Key? key,
    required this.itemIcons,
    required this.centerIcon,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = ColorTheme.orangeLightColor,
    this.unselectedColor = ColorTheme.greyColor,
    this.selectedLightColor = ColorTheme.orangeLightColor,
  })  : assert(itemIcons.length == 4 || itemIcons.length == 2,
            'Item must equal 4 or 2'),
        super(key: key);
  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    final double height = this.height ?? getRelativeHeight(0.076);

    return SizedBox(
      height: height + getRelativeHeight(0.035),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                  color: ColorTheme.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getRelativeWidth(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: itemIcons.length == 4
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(0);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[0],
                                  color: selectedIndex == 0
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                          if (itemIcons.length == 4)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(1);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    itemIcons[1],
                                    color: selectedIndex == 1
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: itemIcons.length == 4
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(itemIcons.length == 4 ? 3 : 2);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[itemIcons.length == 4 ? 2 : 1],
                                  color: selectedIndex ==
                                          (itemIcons.length == 4 ? 3 : 2)
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                          if (itemIcons.length == 4)
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: selectedColor.withOpacity(0.5),
                                onTap: () {
                                  onItemPressed(4);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    itemIcons[3],
                                    color: selectedIndex == 4
                                        ? selectedColor
                                        : unselectedColor,
                                  ),
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
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      onItemPressed(itemIcons.length == 4 ? 2 : 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 5.0, color: ColorTheme.tertiaryColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            selectedLightColor,
                            selectedColor,
                          ],
                        ),
                      ),
                      height: getSearchSize(),
                      width: getSearchSize(),
                      child: Center(
                          child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Icon(
                          centerIcon,
                          color: ColorTheme.tertiaryColor,
                          size: 30,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static initSize(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}

double getRelativeHeight(double percentage) {
  return percentage * SizeConfig.screenHeight;
}

double getRelativeWidth(double percentage) {
  return percentage * SizeConfig.screenWidth;
}

double getSearchSize() {
  double width = SizeConfig.screenWidth;
  if (width > 1000) {
    return 0.045 * SizeConfig.screenWidth;
  } else if (width > 900) {
    return 0.055 * SizeConfig.screenWidth;
  } else if (width > 700) {
    return 0.065 * SizeConfig.screenWidth;
  } else if (width > 500) {
    return 0.075 * SizeConfig.screenWidth;
  } else {
    return 0.165 * SizeConfig.screenWidth;
  }
}
