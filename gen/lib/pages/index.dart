part of 'pages.dart';

class MyIndexPage extends Component {
  final ListPage page;

  final PaginationInfo paginationInfo;

  MyIndexPage(this.page, this.paginationInfo);

  Site get site => page.site;

  String get heading {
    if (page is Tag) {
      return (page as Tag).name;
    } else if (page is Category) {
      return (page as Category).name;
    } else if (page is Section) {
      return (page as Section).name;
    } else if(page is Site) {
      return (page as Site).meta.title;
    }
    throw UnsupportedError('Unsupported list page!');
  }

  @override
  String render() {
    return '''
<html>
  ${HeadComp(page)}

  <body>
    <header class="site">
      <div class="title"><a href="${site.meta.baseURL}">${site.meta.title}</a></div>
    </header>

    <div class="container site">

    <div class="list">
      <header class="list-title"><h1>$heading</h1></header>

      <div class="row">
        <div class="col-sm-9">
          <div class="articles">
            ${range(paginationInfo.start, paginationInfo.end,
            (i) => ListItemPartial(page.pages[i]).render())}
          </div>

          <!-- TODO {{ partial "pagination.html" . }} -->
        </div>
        <div class="col-sm-3 sidebar">
          ${SidebarComp(page)}
        </div>
      </div>
    </div>
    <!-- TODO {{ partial "default_foot.html" . }} -->
  </body>
</html>
    ''';
  }
}