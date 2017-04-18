class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:search]
      @articles = Article.search(params[:search]).order(:title)
        #if :sort_id == nil
        #  @articles = Article.search(params[:search]).order(:title)
        #else
        #  if :sort_id == 1
        #    @articles = Article.search(params[:search]).order(:title)
        #  elsif :sort_id == 2
        #    @articles = Article.search(params[:search]).order(:categories)
        #  elsif :sort_id == 3
        #    @articles = Article.search(params[:search]).order(:quality)
        #  elsif :sort_id == 4
        #    @articles = Article.search(params[:search]).order(:importance)
        #  end
        #end
    else
      @articles = Article.all
      #if :sort_id == 1
      #    @articles = Article.search(params[:search]).order(:title)
      #elsif :sort_id == 2
      #  @articles = Article.search(params[:search]).order(:categories)
      #elsif :sort_id == 3
      #  @articles = Article.search(params[:search]).order(:quality)
      #elsif :sort_id == 4
      #  @articles = Article.search(params[:search]).order(:importance)
      #end
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #parse out categories from categories 
    @delimited_categories = @article.categories.split("|")
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      #@article = Article.find(params[:id])
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :categories, :cited_domains, :cited_authors, :quality, :importance)
    end
end
