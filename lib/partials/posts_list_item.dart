part of site.partials;

class PostsListItemPartial extends Component {
  final SinglePage page;

  PostsListItemPartial(this.page);

  @override
  String render() {
    return '''
<article class="single">
  <header class="article-header">
    <time itemprop="datePublished" pubdate="pubdate"
                  datetime="${page.meta.date.toString()}">
      ${formatDate(page.meta.date, dateFormat)}
    </time>
    <h1 class="article-title">
      <a href="${page.permalink}">${page.meta.title}</a>
    </h1>
  </header>

  <div class="article-body" itemprop="articleBody">${page.content}</div>

  <aside>
    <div class="section">
      ${forEach(page.tags, (Tag t) => '<a href="${t.permalink}" class="tag">${t.name}</a>')}
    </div>
  </aside>
</article>
    ''';
  }
}