part of 'pages.dart';

class MySinglePage extends Component {
  final SinglePage page;

  MySinglePage(this.page);

  String render() => '''
<html>
  ${HeadComp(page)}
  <body>
    ${page.content}
  </body>
</html>
  ''';
}