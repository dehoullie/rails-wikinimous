class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
   find
  end

  def find
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    find
  end

  def update
    find
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    find
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
