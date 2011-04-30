class ArticlesController < ApplicationController
  before_filter :authenticate!, :except => [:index, :show]
  
  def index
    if current_user
      @articles = Article.order('post_date DESC, title')
    else
      @articles = Article.current.order('post_date DESC, title')
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_path, :notice => "Article saved successfully."
    else
      render :new
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to articles_path, :notice => "Article updated successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, :notice => "Article deleted."
  end
end
