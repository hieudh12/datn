class RecipesController < ApplicationController
  before_action :set_scope
  before_action :set_recipe, only: [:show]

  # GET /recipes
  # GET /recipes.json
  def index
    categories = category_search
    ingredients = ingredient_search
    recipes = recipe_search

    @search_query = search_query
    @recipe_hash = {
      category: categories.nil? ? nil : recipes_by_categories(categories),
      ingredient: ingredients.nil? ? nil : recipes_by_ingredients(ingredients),
      recipe: recipes.nil? ? nil : recipes.page(page).per(4)
    }
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @comments = @recipe.comments.all.order('created_at DESC')
    @comment = @recipe.comments.build
  end

  def author
    render 'author'
  end

private
  def recipes_by_categories(categories)
    Recipe.where(category_id: categories.pluck(:id)).order(is_premium: :desc, created_at: :desc).page(page).per(4)
  end

  def recipes_by_ingredients(ingredients)
    Recipe.joins(:ingredients).where(ingredients: {id: ingredients.pluck(:id)}).order(is_premium: :desc, created_at: :desc).page(page).per(4)
  end

  def category_search
    return nil if search_type.present? && search_type != 'category'

    if search_query.present?
      return Category.where('name LIKE ?', "%#{search_query}%")
    else
      return nil
    end
  end

  def ingredient_search
    return nil if search_type.present? && search_type != 'ingredient'

    if search_query.present?
      return Ingredient.where('name LIKE ?', "%#{search_query}%")
    else
      return nil
    end
  end

  def recipe_search
    return nil if search_type.present? && search_type != 'recipe'
    if search_query.present?
      return Recipe.where('name LIKE ?', "%#{search_query}%").order(is_premium: :desc, created_at: :desc)
    else
      return Recipe.order(is_premium: :desc, created_at: :desc)
    end
  end

  # check premium item
  def set_recipe
    @recipe = Recipe.find(params[:id])
    if(@recipe.is_premium? && !current_user&.is_premium?)
      return redirect_to premium_info_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_scope
    if current_user&.is_premium?
      @scope = Recipe.all
    else
      @scope = Recipe.common
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.fetch(:recipe, {})
  end

  def search_query
    params[:query]
  end

  def search_type
    params[:type]
  end

  def page
    params[:page] || 1
  end
end
