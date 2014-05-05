class Admin::News < ActiveRecord::Base
  attr_accessible :description, :link, :published, :title
end
