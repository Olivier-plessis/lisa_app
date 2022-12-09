import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/items.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/book/single_book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/pages/search/search_bar.dart';
import 'package:lisa_app/presentation/widgets/book/book_description.dart';
import 'package:lisa_app/presentation/widgets/book/book_header.dart';
import 'package:lisa_app/presentation/widgets/book/book_page_categories.dart';
import 'package:lisa_app/presentation/widgets/book/book_poster_details.dart';

class SearchDetailsPage extends ConsumerWidget {
  const SearchDetailsPage(
      {super.key, required this.itemId, required this.item});
  final String itemId;
  final Items? item;
  Color get secondaryColor => ColorTheme.secondaryColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleBookState book = ref.watch(singleBookFamilyProvider(itemId));
    final String query = ref.watch(booksSearchTextProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            child: Icon(Icons.chevron_left, color: secondaryColor),
            onTap: () => context.goNamed(AppPage.search.routeName),
          ),
          title: ATextHeadlineFive(
            content: 'result of $query',
          ),
          expandedHeight: 64.0,
        ),
        SliverToBoxAdapter(
          child: book.whenOrNull(
            loaded: (SingleBook book) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookHeader(
                      title: '${book.volumeInfo?.title}',
                      authors: book.volumeInfo!.authors.first,
                      publisher: '${book.volumeInfo?.publisher}',
                      publishedDate: '${book.volumeInfo?.publishedDate}',
                    ),
                    const Gap(20.0),
                    BookPosterDetails(
                      imageLink: '${book.volumeInfo?.imageLinks?.medium}',
                      onTapButton: () {
                        ref
                            .read(favoriteNotifierProvider.notifier)
                            .addToFavorites(book: book);
                        context.goNamed(AppPage.search.routeName);
                      },
                      buttonText: 'add to favorite',
                    ),
                    BookPageCategories(
                      pageCount:
                          int.parse(book.volumeInfo!.pageCount.toString()),
                      categories: '${book.volumeInfo?.categories}',
                    ),
                    BookDescription(
                      description: book.volumeInfo!.description,
                    ),
                    const Gap(40.0),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
