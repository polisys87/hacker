class NewestController < ApplicationController
  def index
    @news = Admin::News.where("published = true").page params[:page]
  end
end
