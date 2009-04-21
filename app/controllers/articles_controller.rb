class ArticlesController < ApplicationController
  
  before_filter { |c| c.send :set_page_title, ['News'] }
  
  caches_page :index, :show, :new
  cache_sweeper :article_sweeper, :only => [:create, :update, :destroy]
  
  # GET /articles
  def index
    @articles = Article.all
  end
  
  # GET /articles/:id
  def show
    @article = Articles.find(params[:id])
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
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  # PUT /articles/:id
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
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
