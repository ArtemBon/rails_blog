class SearchController < ApplicationController
  def search
    if params[:term].nil?
    @articles = []
    else
      @articles = Article.search_everywhere params[:term]
    end
    render 'articles/index'
  end
end
