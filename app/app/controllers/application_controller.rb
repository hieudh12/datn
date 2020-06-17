module StoreLocationBackport
  def store_location_for(resource_or_scope, location)
    session_key = stored_location_key_for(resource_or_scope)
    session[session_key] = location
  end
  
  def stored_location_for(resource_or_scope)
    session_key = stored_location_key_for(resource_or_scope)
    if is_navigational_format?
      session.delete(session_key)
    else
      session[session_key]
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
  
  private 
    def stored_location_key_for(resource_or_scope)
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      "#{scope}_return_to"
    end
end

class ApplicationController < ActionController::Base
  rescue_from Exception, :with => :render_404

  before_action :set_variables
  before_action :configure_permitted_parameters, if: :devise_controller?
  include StoreLocationBackport
  before_action :store_user_location!, if: :storable_location?

  protected
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

private

  def render_404(e)
    logger.debug e
    render :template => 'error_pages/404', :layout => false, :status => :not_found
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
  def storable_location?
    request.get? && !devise_controller? && !request.xhr? 
  end

  def store_user_location
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def set_variables
    @category_1 = Category.where(name: "Hanoi foods").take
    @recipes_1 = @category_1.recipes.order('created_at DESC').limit(4)
    @category_2 = Category.where(name: "Saigon foods").take
    @recipes_2 = @category_2.recipes.order('created_at DESC').limit(4)
    @category_3 = Category.where(name: "Central foods").take
    @recipes_3 = @category_3.recipes.order('created_at DESC').limit(4)
    @category_4 = Category.where(name: "Tet foods").take
    @recipes_4 = @category_4.recipes.order('created_at DESC').limit(4)
    @category_5 = Category.where(name: "Summer foods").take
    @recipes_5 = @category_5.recipes.order('created_at DESC').limit(4)
    @category_rv = Category.where(name: "Review").take
    @recipes_rv = @category_rv.recipes.order('created_at DESC').limit(5)
    @recipes_rd = Recipe.offset(Recipe.count - 6).limit(4)
  end
end
