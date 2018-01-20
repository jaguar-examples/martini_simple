library site.layout;

import 'dart:async';
import 'package:stencil/stencil.dart';
import 'package:jaguar_martini/jaguar_martini.dart';

import 'package:blog/partials/partials.dart';

part 'posts_index_page.dart';
part 'posts_single_page.dart';

class PaginationInfo {
  final int number;

  final int itemsPerPage;

  final itemsInThisPage;

  PaginationInfo(this.itemsPerPage, this.number, this.itemsInThisPage);

  int get start => (number - 1) * itemsPerPage;

  int get end => start + itemsInThisPage;
}

class DefaultWriter implements SectionWriter {
  /// Renders single pages of the section
  FutureOr<String> single(SinglePage page) {
    return new PostsSinglePage(page).render();
  }

  /// Renders list pages of the section
  ///
  /// List pages include
  FutureOr<List<String>> index(ListPage page) {
    final int articlesPerPage = 10;
    final ret = <String>[];
    for (int i = 0; i < page.pages.length; i += articlesPerPage) {
      final int pageNum = (i ~/ articlesPerPage) + 1;
      int itemsInThisPage = articlesPerPage;
      if ((i + itemsInThisPage) > page.pages.length) {
        itemsInThisPage = page.pages.length % articlesPerPage;
      }
      final paginationInfo =
          new PaginationInfo(articlesPerPage, pageNum, itemsInThisPage);
      ret.add(new PostsIndexPage(page, paginationInfo).render());
    }
    return ret;
  }

  List<String> tags(Tag tag) => [];

  List<String> categories(Category cat) => [];
}
