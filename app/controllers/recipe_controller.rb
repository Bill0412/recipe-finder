class RecipeController < ApplicationController
  def index
    @search_term = params[:search]
    # puts "search_term: #{@search_term}"
    # puts "params: #{params}"
    @search_term = "chocolate" if @search_term.nil?

    recipes = Recipe.for @search_term
    # puts recipes
    @rows = []
    recipes.each do |recipe|
      @rows << {thumbnail: recipe['image_url'], title: recipe['title'], social_rank: recipe['social_rank'], recipe_url: recipe['f2f_url']}
    end
    #puts "rows: #{@rows}"
  end
end
