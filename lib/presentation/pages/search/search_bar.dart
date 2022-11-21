import 'package:flutter/material.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';

final StateProvider<String> booksSearchTextProvider =
    StateProvider<String>((StateProviderRef<String> ref) {
  return '';
});

class BooksSearchBar extends ConsumerStatefulWidget {
  const BooksSearchBar({super.key});

  @override
  ConsumerState<BooksSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<BooksSearchBar> {
  final TextEditingController _controller = TextEditingController();

  Color get secondaryColor => ColorTheme.secondaryColor;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String query = ref.watch(booksSearchTextProvider);
    return SizedBox(
      height: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: TextField(
          controller: _controller,
          style: textTheme.subtitle2!.copyWith(
              color: secondaryColor,
              fontSize: 10,
              fontWeight: FontWeightTheme.medium),
          cursorHeight: 16,
          cursorColor: secondaryColor,
          decoration: InputDecoration(
            fillColor: Colors.transparent, //<-- SEE HERE
            contentPadding: const EdgeInsets.symmetric(vertical: 3.0),
            border: InputBorder.none,
            isDense: true,
            hintText: 'Search book',
            hintStyle: textTheme.subtitle2!.copyWith(
                color: ColorTheme.greyColor,
                fontSize: 10,
                fontWeight: FontWeightTheme.medium),
            prefixIcon: IconButton(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              onPressed: () => _controller.clear(),
              icon: Icon(Icons.search, color: secondaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: secondaryColor),
            ),
          ),
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (String text) {
            ref.read(booksSearchTextProvider.notifier).state = text;
          },
          onSubmitted: (String value) {
            ref.read(booksNotifierProvider.notifier).searchBook(query);
          },
        ),
      ),
    );
  }
}
