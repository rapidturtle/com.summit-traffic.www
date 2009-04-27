class ArticlesController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['News'] }
  
  caches_page :index, :ticker, :show, :new
  cache_sweeper :article_sweeper, :only => [:create, :update, :destroy]
  
  # GET /articles
  def index
    @articles = Article.all(:order => 'post_date DESC')
    @year = @articles.group_by { |a| a.post_date.beginning_of_year }
  end
  
  # GET /articles/ticker
  def ticker
    @articles = Article.all(:limit => 5, :order => 'post_date DESC')
    respond_to do |format|
      format.rss # /articles/ticker.rss
    end
  end
  
  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
    @page_title << @article.title
  end
  
  # GET /articles/new
  def new
    @article = Article.new
  end
  
  # GET /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
  end
  
  # POST /articles
  def create
    @article = Article.new(params[:article])
    
    if @article.save
      flash[:notice] = "<em>#{@article.title}</em> was successfully created."
      redirect_to articles_path
    else
      render :action => 'new'
    end
  end
  
  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      flash[:notice] = "<em>#{@article.title}</em> was successfully updated."
      redirect_to articles_path
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end

end
