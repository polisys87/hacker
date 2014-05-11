class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true
  attr_accessible :provider, :uid
end
