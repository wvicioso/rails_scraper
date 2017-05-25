require 'nokogiri'

module WebsitesHelper

  # reads provided url using nokugiri
  def html_parser(url)
    # this rescue is needed for invalid urls
    begin
      html_file = open(url)
    rescue Exception => e
      return {error: 'That url was not found. Try another.'}
    end

    Nokogiri.parse(html_file)
  end

  # parses nokugiri document for provided html tag
  def parse_for_tag(nokogiri_doc, tag)
    nokogiri_doc.css(tag).map { |item| clean_html(item.inner_text) }
  end

  # iterates through an array of html inner text and removes all white spaces and empty spaces
  def clean_html(html_item)
      condensed_item = condense_whitespace(html_item)
      strip_whitespace(condensed_item)
  end

  # BOTH METHODS BELOW ARE NEEDED TO RETURN ONLY TEXT FROM PARSED HTML

  # condenses whitespace with regex
  # encode method is needed to prevent code from breaking if a user provides a google search link
  def condense_whitespace(html_item)
    html_item
    .encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
    .gsub(/\s+/, " ")
  end

  # removes all whitespaces with regex
  def strip_whitespace(html_item)
    white_space = /(?<=>)\s+(?=<)/
    html_item.gsub(white_space, "").strip
  end
end
