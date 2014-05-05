class Admin::News < ActiveRecord::Base
  attr_accessible :description, :link, :published, :title
  validates :title, presence: true
  validates :link, presence: true, format:{ with: URI::regexp(%w(http https)), message: 'must be start with http:// or https://' }
end
