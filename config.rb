
# activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown,
  :fenced_code_blocks => true,
  :lax_html_blocks => true

activate :blog do |blog|
  blog.prefix = 'journal'
  blog.layout = 'layouts/blog'
  blog.permalink = ':title.html'
  blog.tag_template = 'journal/category.html'
  blog.taglink = "categories/:tag.html"
  blog.paginate = true
  blog.per_page = 1
  blog.summary_separator = /READMORE/
end

activate :directory_indexes
activate :relative_assets

page '/journal/feed.xml', layout: false

configure :build do
  set :relative_links, true
  # activate :minify_css
  # activate :minify_javascript
  # activate :asset_hash
end

helpers do

  def intro(article)
    article.render(:layout => false, :keep_separator => true).split('<p>READMORE</p>')[0]
  end

  def body(article)
    article.render(:layout => false, :keep_separator => true).split('<p>READMORE</p>')[1]
  end

end