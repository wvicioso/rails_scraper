# Rails Web Scraper

This a web scraping Rails application that can also be used solely as an API.

## Setup Instructions:
#### In your console

1) `git clone https://github.com/wvicioso/rails_scraper.git && cd rails_scraper`
#### then

2) `bundle install && rake db:create && rake db:migrate && rails s`

## API Documentation:
### get all previously parsed websites:
      route: http://localhost:3000/websites
      method: 'get',
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }

### get one website and its html content:
      route: http://localhost:3000/websites/{website-id}
      method: 'get',
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }

### parse new website and get its html contents:
      route: http://localhost:3000/websites
      method: 'post',
      body: JSON.stringify({
        link: "url",
      }),
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }

## App Documentation:
1) go to `http://localhost:3000/` in your web browser
#### then

2) use the app freely
