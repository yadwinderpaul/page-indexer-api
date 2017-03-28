class PageIndexDetailSerializer < ActiveModel::Serializer
  attributes :id, :url

  has_many :headings
  has_many :links
end
