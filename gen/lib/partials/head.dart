part of site.partials;

/// Partial to renders HTML head component for a given [page]
class HeadComp extends Component {
  final AnyPage page;

  HeadComp(this.page);

  Site get site => page.site;

  String get title {
    if (page is SinglePage) {
      return (page as SinglePage).meta.title + ': ' + site.meta.title;
    } else if (page is Tag) {
      return (page as Tag).name + ': ' + site.meta.title;
    } else if (page is Category) {
      return (page as Category).name + ': ' + site.meta.title;
    } else if (page is Section) {
      return (page as Section).name + ': ' + site.meta.title;
    } else if (page is Site) {
      return (page as Site).meta.title;
    }
    throw new UnsupportedError('Unsupported list page!');
  }

  String render() {
    return '''
<head>
    <title>$title</title>
    <meta property='og:title' content="$title">
    <meta property="og:type" content="${page is Site? 'website': 'article'}">
    ${when(page is SinglePage, () => '<meta name="description" content="${(page as SinglePage).meta.description}">')}
    <meta property="og:url" content="${page.permalink}">
    <!-- TODO meta og:image -->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

    <meta name="generator" content="Martini 0.1.0" />

    <!-- My stylesheets -->
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/prettify_own.css">
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/styles.css">
    <link rel="stylesheet" href="${site.meta.baseURL}/static/css/custom.css">
    <!-- My RSS -->
    <link rel="alternate" type="application/rss+xml" title="RSS" href="${site.meta.baseURL}/index.xml">
</head>
    ''';
  }

  String toString() => render();
}

/*
    <!-- Fonts -->
    <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Open+Sans|Marcellus+SC'>
    <link href="https://fonts.googleapis.com/css?family=Miriam+Libre:400,700|Source+Sans+Pro:200,400,700,600,400italic,700italic" rel="stylesheet" type="text/css">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Font awesome -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!--Google prettify-->
    <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js?lang=dart&lang=go&lang=css&lang=swift&lang=vhdl&lang=yaml"></script>

 */