class UrlMapping
  include ActiveModel::Model

  attr_accessor :original_url, :short_url

  validates :original_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
