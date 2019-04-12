library site.layout;

import 'package:jaguar_martini/jaguar_martini.dart';

import 'package:blog/pages/pages.dart';
import 'package:blog/utils/pagination.dart';

part 'section.dart';

class SiteSpec implements SiteRenderer {
  @override
  final shortcodes = <ShortCode>[];

  @override
  final sections = <String, SectionRenderer>{};

  final SectionRenderer defaultSectionRenderer;

  SiteSpec(
      {List<ShortCode> shortcodes: const [],
      Map<String, SectionRenderer> sections: const {},
      this.defaultSectionRenderer}) {
    this.shortcodes.addAll(shortcodes);
    this.sections.addAll(sections);
  }

  /// Renders list pages of the section
  ///
  /// List pages include
  List<String> index(ListPage page) {
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

  List<String> tags(Tag tag) => [];

  List<String> categories(Category cat) => [];
}
