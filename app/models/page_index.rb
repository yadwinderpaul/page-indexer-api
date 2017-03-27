require 'open-uri'

class PageIndex < ApplicationRecord

  # model event listeners
  before_create :parse_url

  # relations
  has_many :headings, dependent: :destroy
  has_many :links, dependent: :destroy

  # validations
  validates :url,
            :presence => true,
            format: {
              with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/
            }

  # main parsing method
  def parse_url
    # cannot be created with false entries
    self.headings = []
    self.links = []

    doc = Nokogiri::HTML(open(self.url))
    self.content = doc.to_s

    links = doc.css('a')
    headings = doc.css('h1, h2, h3')

    self.links.build(links.map{ |link|
      {
        :text => link.text.strip,
        :url => link['href']
      }
    })

    self.headings.build(headings.map{ |heading|
      {
        :text => heading.text.strip,
        :name => heading.name
      }
    })
  end

end
