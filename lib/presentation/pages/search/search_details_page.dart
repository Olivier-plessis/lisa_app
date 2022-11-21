import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/items.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/single_book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/presentation/widgets/book_poster_widget.dart';

class SearchDetailsPage extends ConsumerWidget {
  const SearchDetailsPage(
      {super.key, required this.itemId, required this.item});
  final String itemId;
  final Items? item;
  Color get secondaryColor => ColorTheme.secondaryColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleBookState book = ref.watch(singleBookFamilyProvider(itemId));

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.chevron_left, color: secondaryColor),
          onTap: () => context.goNamed(AppPage.search.routeName),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Material(
              child: book.whenOrNull(
                loading: () => Column(
                  children: [
                    const Center(
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 10,
                        backgroundColor: ColorTheme.failureRed,
                      ),
                    ).paddedV(100),
                  ],
                ),
                loaded: (SingleBook book) {
                  return Column(
                    children: [
                      BookPoster(
                          imagePath: book.volumeInfo?.imageLinks?.medium),
                      Text(book.volumeInfo!.authors!.first),
                      Text('${book.volumeInfo?.title}'),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(favoriteNotifierProvider.notifier)
                                .addToFavorites(book: book);
                            context.goNamed(AppPage.search.routeName);
                          },
                          child: Text('add to favourite')),
                      Text(Utilities.removeAllHtmlTags(
                          book.volumeInfo!.description.toString())),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
