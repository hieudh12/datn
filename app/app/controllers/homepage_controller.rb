class HomepageController < ApplicationController
  def index
    page = params[:page] ? params[:page] : 1
    # @recipes = Recipe.offset(Recipe.count - 6).limit(6) # Random 6 recommended recipe
    @recipes = Recipe.left_joins(:ratings).group(:id).order('SUM(rate)/COUNT(ratings.user_id) DESC').limit(8)
    render "homepage/home"
  end

  def single
    render "template/single-post"
  end

  def category_post
    render "template/catagory-post"
  end

  def category
    render "template/catagory"
  end

  def contact
    render "template/contact"
  end

  def recipe
    render "template/receipe"
  end
end
