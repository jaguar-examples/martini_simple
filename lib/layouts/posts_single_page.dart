part of site.layout;

class PostsSinglePage extends Component {
  final SinglePage page;

  PostsSinglePage(this.page);

  String render() => '''
<html>
  ${comp(new HeadComp(page))}
  <body>
    ${page.content}
  </body>
</html>
  ''';
}