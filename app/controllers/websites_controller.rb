class WebsitesController < ApplicationController
  protect_from_forgery with: :null_session
  include WebsitesHelper

  def index
    @websites = Website.all

    respond_to do |format|
      format.html
      format.json { render :json => @websites }
    end
  end

  def show
    website = Website.find_by(id: params[:id])

    respond_to do |format|
      if website
        @response = website.format_json_response
        format.html
        format.json { render :json => @response }
      else
        format.html { redirect_to root_path }
        format.json { render :json => {status: 400, error: "Does not exist."}  }
      end
    end
  end

  def new
  end

  def create
    search_tags = ["h1", "h2", "h3"]
    link = params[:link]
    parsed_link = html_parser(link) #html_parser exists in WebsitesHelper module

    respond_to do |format|
      if parsed_link[:error]
        @errors = parsed_link[:error]

        format.html { render new_website_path }
        format.json { render :json => {status: 400, error: @errors} }
      else
        @new_website = Website.create({link: link})
        html_content = search_tags.map { |tag| [parse_for_tag(parsed_link, tag), tag] } # parses through html with given search tags
        html_content.each { |item| @new_website.create_html_items(item[0], item[1]) } # creates html_items that belong to the created website object
        response = @new_website.format_json_response

        format.html { redirect_to @new_website }
        format.json { render :json => response }
      end
    end
  end
end
