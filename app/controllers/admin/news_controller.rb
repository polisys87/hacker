class Admin::NewsController < BackendApplicationController
  # GET /admin/news
  # GET /admin/news.json
  def index
    @admin_news = Admin::News.page params[:page]
#    @admin_news = Admin::News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_news }
    end
  end

  # GET /admin/news/1
  # GET /admin/news/1.json
  def show
    @admin_news = Admin::News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_news }
    end
  end

  # GET /admin/news/new
  # GET /admin/news/new.json
  def new
    @admin_news = Admin::News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_news }
    end
  end

  # GET /admin/news/1/edit
  def edit
    @admin_news = Admin::News.find(params[:id])
  end

  # POST /admin/news
  # POST /admin/news.json
  def create
    @admin_news = Admin::News.new(params[:admin_news])

    respond_to do |format|
      if @admin_news.save
        format.html { redirect_to @admin_news, notice: 'News was successfully created.' }
        format.json { render json: @admin_news, status: :created, location: @admin_news }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/news/1
  # PUT /admin/news/1.json
  def update
    @admin_news = Admin::News.find(params[:id])

    respond_to do |format|
      if @admin_news.update_attributes(params[:admin_news])
        format.html { redirect_to @admin_news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/news/1  
  # DELETE /admin/news/1.json
  def destroy
    
    @admin_news = Admin::News.find(params[:id])
    @admin_news.destroy

    respond_to do |format|
      format.html { redirect_to admin_news_index_url }
      format.json { head :no_content }
    end
  end
end
