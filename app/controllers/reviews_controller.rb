class ReviewsController < ApplicationController


  def index

  end

  def show

  end

  def new
    @review = Review.new
    @schools = School.all
  end

  def create


    # @article = Article.new(article_params)
    # @article.user = current_user
    # @article.save
    # flash.notice = "Article '#{@article.title}' Created!"
    # redirect_to article_path(@article)
  end

  def destroy
    # article = Article.find(params[:id])
    # flash.notice = "Article '#{article.title}' deleted!"
    # article.destroy

    # redirect_to action: "index"
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    # @article.update(article_params)

    # flash.notice = "Article '#{@article.title}' Updated!"

    # redirect_to article_path(@article)
  end

end
