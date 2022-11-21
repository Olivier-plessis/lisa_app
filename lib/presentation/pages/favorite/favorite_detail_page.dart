import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/single_book.dart';
import 'package:lisa_app/common/domain/state/single_book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/common/utils/string_formater.dart';
import 'package:lisa_app/presentation/widgets/book_poster_widget.dart';

class FavoriteDetailsPage extends ConsumerWidget {
  const FavoriteDetailsPage(
      {super.key, required this.singleBookId, required this.singleBook});
  final String singleBookId;
  final SingleBook? singleBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleBookState favoriteBook =
        ref.watch(singleBookFamilyProvider(singleBookId));

    return Scaffold(
      backgroundColor: ColorTheme.tertiaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              child: const Icon(
                Icons.chevron_left,
                color: ColorTheme.secondaryColor,
              ),
              onTap: () => context.goNamed(AppPage.favorite.routeName),
            ),
            title: const ATextHeadlineFive(
              content: 'Favorite book detail',
            ),
            expandedHeight: 140.0,
          ),
          SliverToBoxAdapter(
            child: favoriteBook.whenOrNull(
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      BookPoster(
                          imagePath: book.volumeInfo?.imageLinks?.medium),
                      Text(book.volumeInfo!.authors!.first),
                      Text('${book.volumeInfo?.title}'),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(favoriteNotifierProvider.notifier)
                                .removeFromFavorites(book: book);
                            context.goNamed(AppPage.favorite.routeName);
                          },
                          child: Text('remove to favourite')),
                      Text(Utilities.removeAllHtmlTags(
                          book.volumeInfo!.description.toString())),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
