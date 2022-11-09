import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_bottom_bar/lisa_bottom_bar.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;
  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();

  static int _calculateSelectedIndex(
    BuildContext context,
  ) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(AppPage.home.routePath)) {
      return 0;
    }
    if (location.startsWith(AppPage.reading.routePath)) {
      return 1;
    }
    if (location.startsWith(AppPage.search.routePath)) {
      return 2;
    }
    if (location.startsWith(AppPage.favorite.routePath)) {
      return 3;
    }
    if (location.startsWith(AppPage.profile.routePath)) {
      return 4;
    }
    return 0;
  }
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.mainLightColor,
      body: widget.child,
      bottomNavigationBar: LisaBottomNavigation(
        itemIcons: const <IconData>[
          Icons.home,
          Icons.menu_book,
          Icons.favorite,
          Icons.person,
        ],
        centerIcon: Icons.search_outlined,
        selectedIndex: ScaffoldWithNavBar._calculateSelectedIndex(context),
        onItemPressed: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppPage.home.routePath);
        break;
      case 1:
        GoRouter.of(context).go(AppPage.reading.routePath);
        break;
      case 2:
        GoRouter.of(context).go(AppPage.search.routePath);
        break;
      case 3:
        GoRouter.of(context).go(AppPage.favorite.routePath);
        break;
      case 4:
        GoRouter.of(context).go(AppPage.profile.routePath);
        break;
    }
  }
}
