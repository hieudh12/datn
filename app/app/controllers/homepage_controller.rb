class HomepageController < ApplicationController
  def index
    page = params[:page] ? params[:page] : 1
    
    @recipes = Recipe.order('created_at DESC').page(params[:page]).per(10)
    @recipes_side = Recipe.left_joins(:ratings).group(:id).order('SUM(rate)/COUNT(ratings.user_id) DESC').limit(4)
    @recipes_rcm = Recipe.left_joins(:bookmarks).group(:id).order('COUNT(bookmarks.user_id) DESC').limit(4)

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
