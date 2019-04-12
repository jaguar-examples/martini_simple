part of 'spec.dart';

class SectionSpec implements SectionRenderer {
  @override
  List<String> index(Section page) {
    final int articlesPerPage = 10;
    final ret = <String>[];
    for (int i = 0; i < page.pages.length; i += articlesPerPage) {
      final int pageNum = (i ~/ articlesPerPage) + 1;
      int itemsInThisPage = articlesPerPage;
      if ((i + itemsInThisPage) > page.pages.length) {
        itemsInThisPage = page.pages.length % articlesPerPage;
      }
      final paginationInfo =
      PaginationInfo(articlesPerPage, pageNum, itemsInThisPage);
      ret.add(MyIndexPage(page, paginationInfo).render());
    }
    return ret;
  }

  @override
  List<String> categories(Category categories) => [];

  @override
  List<String> tags(Tag tags) => [];

  @override
  String single(SinglePage page) {
    return MySinglePage(page).render();
  }
}