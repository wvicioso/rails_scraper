# Rails Web Scraper

Our primary data vendor is eMBS Inc. eMBS is a data and analytics provider that specializes in information related to the Mortgage-Backed Securities market. eMBS data is used in a wide range of applications including Security Master, BondCalc, and ANOTHER-APP.

For Pools, eMBS provides History data like CPR, Factor, and PSA. They also provide Loan Distribution details like coupon, loan age, remaining maturity, along with many other data points.

In order to produce accurate forecasts with optimal run-time efficiency, BRS has also developed a proprietary algorithm to
aggregate loan-level data into computationally efficient clusters along with a mapping between Intex and LP data that
leverages the Intex cash flow engine for more efficient pool-level projections. On the collateral level, the non-agency models
will forecast prepayment, default, delinquency, severity rates and loss amounts. 


Each month , eMBS posts new files on their FTP site, we have automatic process that run in daily and monthly intervals to indentify newly uploaded files and copy them to Central IQ server (NDHMTG). The process of loading the data into CENTRAL involves a few steps that we will now walk through.

First, the mbs/pool data files are downloaded from eMBS. Once the files are downloaded, they are stored into specific directories within Blackrock that can be accessed through Xterm. From these directories, scripts are then run to inject the mbs/pool data into two general locations, the production severs and backup servers. From the production server, the data is then synchronized to CENTRAL.

CENTRAL exists is because, about five years ago, there was an initiative to centralize all clients information on mortage backed securities. The goal of this was to ultimately reduce the amount of hardware needed for each individual client implementation. Now, majority of MBS data is stored in CENTRAL allowing all clients to have access to the same MBS/POOL data.

Pricing cusips for these pools are generated using this data through Blackrock processes

This a web scraping Rails application that can also be used solely as an API.
pedersen.akp@gmail.com 
Amanda <Amanda.Pedersen@blackrock.com>; Halpin, Joe <Joe.Halpin@blackrock.com>; Kain, Branimir <Branimir.Kain@blackrock.com>; O'Donnell-McCarthy, Claire <claire.odonnellmccarthy@blackrock.com>; Marks, Tuvia <Tuvia.Marks@blackrock.com>; justin.boganey@blackrock.com
## Setup Instructions:
#### In your console

1) `git clone https://github.com/wvicioso/rails_scraper.git && cd rails_scraper`
#### then

2) `bundle install && rake db:create && rake db:migrate && rake db:seed && rails s`

## API Documentation:
### get all previously parsed websites and their html content:
      route: 'http://localhost:3000/websites'
      method: 'get',
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }
#### response format:
      {
            status: 200,
            1: {
                  link: "url"
                  h1Tags: [],
                  h2Tags: [],
                  h3Tags: [],
            },
            2: {
                  link: "url"
                  h1Tags: [],
                  h2Tags: [],
                  h3Tags: [],
            }
      }

### get one website and its html content:
      route: 'http://localhost:3000/websites/{website-id}'
      method: 'get',
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }
#### response format:
      {
            status: 200,
            link: "url",
            h1Tags: [],
            h2Tags: [],
            h3Tags: [],
      }

### parse new website and get its html content:
      route: 'http://localhost:3000/websites'
      method: 'post',
      body: JSON.stringify({
        link: 'url',
      }),
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' }
#### response format:
      {
            status: 200,
            link: "url",
            h1Tags: [],
            h2Tags: [],
            h3Tags: [],
      }

## App Documentation:
1) go to `http://localhost:3000/` in your web browser
#### then

2) use the app freely
