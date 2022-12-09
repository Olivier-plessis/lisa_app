import 'package:app_ui/app_ui.dart';
import 'package:atomic_ui/atomic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lisa_app/common/datas/providers/providers.dart';
import 'package:lisa_app/common/domain/models/book/book.dart';
import 'package:lisa_app/common/domain/models/book/items.dart';
import 'package:lisa_app/common/domain/state/book/book_state.dart';
import 'package:lisa_app/common/routes/router_utils.dart';
import 'package:lisa_app/presentation/pages/search/search_bar.dart';
import 'package:lisa_app/presentation/widgets/book/book_card.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
  });

  Color get secondaryColor => ColorTheme.secondaryColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            child: Icon(Icons.chevron_left, color: secondaryColor),
            onTap: () => context.goNamed(AppPage.home.routeName),
          ),
          title: const ATextHeadlineFive(
            content: 'Catalog books',
          ),
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(top: 10),
            title: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                  top: size.height * .12,
                  left: size.width * .02,
                  right: size.width * .02),
              height: size.height * .48,
              decoration: const BoxDecoration(
                color: ColorTheme.orangeLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const BooksSearchBar(),
            ),
          ),
        ),
        const _SearchList(),
      ],
    );
  }
}

class _SearchList extends ConsumerWidget {
  const _SearchList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BookState booksList = ref.watch(booksNotifierProvider);
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            color: ColorTheme.tertiaryColor,
            child: booksList.whenOrNull(
              loading: () => Container(
                color: ColorTheme.tertiaryColor,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    kToolbarHeight,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 10,
                    backgroundColor: ColorTheme.failureRed,
                  ),
                ).paddedV(100),
              ),
              error: (_) => SizedBox(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    kBottomNavigationBarHeight -
                    kToolbarHeight,
                child: const Padding(
                  padding: EdgeInsets.all(58.0),
                  child: Center(
                    child: Text(
                      'Enter the title of the book and press enter to see the results of your search',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              loaded: (Book books) {
                return SearchList(books: books);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.books,
  });
  final Book books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: books.items!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 40);
            },
            itemBuilder: (BuildContext context, int index) {
              final Items item = books.items![index];
              return _SearchListCard(
                item: item,
                pressRead: () => context.go(
                  '${AppPage.search.routePath}/${item.id}',
                  extra: item,
                ),
              );
            }),
      ],
    );
  }
}

class _SearchListCard extends StatelessWidget {
  const _SearchListCard({
    required this.item,
    required this.pressRead,
  });
  final Items item;
  final Function() pressRead;

  @override
  Widget build(BuildContext context) {
    return BookCard(
      title: '${item.volumeInfo!.title}',
      auth: '${item.volumeInfo!.authors?.first}',
      image: '${item.volumeInfo?.imageLinks?.thumbnail}',
      pressRead: pressRead,
      buttonLabel: 'See details',
    );
  }
}
