class Link < ActiveRecord::Base
  validates :url, presence: true, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }
  validates :identifier, presence: true, uniqueness: true

  has_many :clicks, dependent: true
end
