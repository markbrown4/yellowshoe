xml.instruct!
xml.feed "xmlns" => "https://www.w3.org/2005/Atom" do
  xml.title "Introspection on work, life and the web."
  xml.subtitle "I write about things that I'm interested in."
  xml.id "https://yellowshoe.com.au/journal"
  xml.link "href" => "https://yellowshoe.com.au/journal"
  xml.link "href" => "https://yellowshoe.com.au/journal/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Mark Brown" }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Mark Brown" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
