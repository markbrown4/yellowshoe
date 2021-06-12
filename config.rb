
set :markdown_engine, :redcarpet
set :markdown,
  :fenced_code_blocks => true,
  :lax_html_blocks => true

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

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
end

helpers do
  def intro(article)
    article.render(:layout => false, :keep_separator => true).split('<p>READMORE</p>')[0]
  end

  def body(article)
    article.render(:layout => false, :keep_separator => true).split('<p>READMORE</p>')[1]
  end
end

class StaticExtension < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  def after_build
    FileUtils.cp_r 'static/.', 'build'
  end
end

Middleman::Extensions.register(:static_extension, StaticExtension)

activate :static_extension
