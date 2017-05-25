class Website < ApplicationRecord
  has_many :html_items

  def create_html_items(html_content, html_tag)
    html_content.each do |item|
      self.html_items.create({tag: html_tag, content: item}) if item
    end
  end

  def sort_html_tags(tag)
    self.html_items.select { |item| item.tag == tag }
  end
# formats content to by consumed by javascript front-end
  def format_single_json_response
    {
      status: 200,
      link: self.link,
      h1Tags: self.sort_html_tags("h1"),
      h2Tags: self.sort_html_tags("h2"),
      h3Tags: self.sort_html_tags("h3")
    }
  end

  def format_all_json_response
    {
      link: self.link,
      h1Tags: self.sort_html_tags("h1"),
      h2Tags: self.sort_html_tags("h2"),
      h3Tags: self.sort_html_tags("h3")
    }
  end
end
