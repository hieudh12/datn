class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    recipe_id = params[:id]
    bookmark = Bookmark.create(recipe_id: recipe_id, user_id: current_user.id)
    respond_to do |format|
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end

  def destroy
    recipe_id = params[:id]
    user_id = current_user.id
    Bookmark.where(recipe_id: recipe_id, user_id: user_id).destroy_all
    respond_to do |format|
      format.json { head :no_content }
      format.js   { render :layout => false }
   end
  end
end
