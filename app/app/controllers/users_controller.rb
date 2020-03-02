class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    render "user/profile"
  end

  def update_profile
      @user = User.find(current_user.id)
      if @user.update_with_password(user_profile_params)
        flash[:notice] = "Your profile was successfully updated"
        redirect_to profile_path
      else
        flash[:error] = @user.errors
        redirect_to profile_path
      end
  end

  def change_password
  end

  def update_password
  end

  def show_bookmarked_recipes
    @user = User.find(current_user.id)
    @bookmarks = @user.bookmarks
    @recipes = [];
    @bookmarks.each { |bookmark| @recipes << bookmark.recipe }
    render 'recipes/bookmarked_recipes'
  end

  private
  def user_profile_params
    params.require(:user).permit(:username, :email, :avatar, :current_password, :password)
  end
end
