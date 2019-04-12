part of site.partials;

/// Partial to render sidebar component
class SidebarComp extends Component {
  final AnyPage page;

  SidebarComp(this.page);

  @override
  String render() {
    return '''
<aside class="site">
	<div class="section">
	  <header><div class="title">LatestPosts</div></header>
	  <div class="content">
	    ${forEach(page.site.pages.take(10), (SinglePage p) => '''
	    <div class="sm">
		    <article class="li">
				  <a href="${p.permalink}" class="clearfix">
				    <div class="detail">
				      <time>${formatDate(p.meta.date, dateFormat)}</time>
				      <h2 class="title">${p.meta.title}</h2>
				    </div>
				  </a>
				</article>
	    </div>
	    ''')}
	  </div>
	</div>

	<div class="section">
	  <header><div class="title">Categories</div></header>
	  <div class="content">
	    ${forEach(page.site.categories.values, (Category c) => '''
	    <a href="${c.permalink}">${c.name}</a>
	    ''')}
	  </div>
	</div>

	<div class="section taxonomies">
	  <header><div class="title">Tags</div></header>
	  <div class="content">
	    ${forEach(page.site.tags.values.take(10), (Tag t) => '''
	    <a href="${t.permalink}">${t.name}</a>
	    ''')}
	  </div>
	</div>
</aside>
		''';
  }
}