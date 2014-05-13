class SessionsController < ApplicationController
  
  
  def new
  end

  def create
    
    auth_hash = request.env['omniauth.auth']
    #    render :text => auth_hash.inspect
    
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      session[:user_name] = @authorization.user.name
#      render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
      redirect_to :controller => "newest", :action => "index"
    else
      user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      user.save
      session[:user_name] = auth_hash["info"]["name"]
      #      render :text => "Hi #{user.name}! You've signed up."
      redirect_to :controller => "newest", :action => "index"
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
  
  def destroy
    session[:user_name] = nil
#    render :text => "You've logged out!"
    redirect_to :controller => "newest", :action => "index"
  end
end
