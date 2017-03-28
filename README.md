# Page Indexer API
An API written in Ruby on Rails to index webpages. It fetches the URL's content, parses and stores header tags and the links. It is helpful to maintain a knowledgebase of webpages, categorized according to their topics, since headings tags contain the point of view of the entire webpage. And will work awesomely with a web crawler.

## Endpoints
To index a page's content
```
POST /page_indices?url=http://www.parse_this_url.com
```
To get a list of all parsed URLs with their content
```
GET /page_indices
```

## Authentication
To access the above routes, you have to pass thorugh Basic HTTP Auth.
A default user is seeded while setting up project:
```
name: cool_user
password: secret_sauce_7
```

## Install and Run
* Setup a Ruby on Rails environment
* Clone the repo
* bundle install
* rails db:create db:migrate db:seed
* rails server
