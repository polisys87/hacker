class NewestController < ApplicationController
  def index
    @news = Admin::News.page params[:page]
  end
end
