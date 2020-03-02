class CommentsController < ApplicationController
    before_action :authenticate_user!
    def index
    end
    
    def show
    end
    
    def new
        @comment = Comment.new
    end
    
    def create
        @comment= Comment.new(comment_params)
        @comment.save
        redirect_to recipe_path(@comment.recipe_id)
    end
    
    def edit
    end
    
    def update
        @comment = Comment.find_by params.require(:comment).permit(:id)
        @comment.update(params.require(:comment).permit(:content))
        redirect_to recipe_path(@comment.recipe_id)
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to recipe_path(@comment.recipe_id)
    end
    
    def create_reply
        @reply= Reply.new(reply_params)
        @reply.save
        redirect_to recipe_path(@reply.comment.recipe_id)
    end

    def update_reply
        @reply = Reply.find_by params.require(:reply).permit(:id)
        @reply.update(params.require(:reply).permit(:content))
        redirect_to recipe_path(@reply.comment.recipe_id)
    end

    def destroy_reply
        @reply = Reply.find(params[:id])
        @reply.destroy
        redirect_to recipe_path(@reply.comment.recipe_id)
    end
private
    def comment_params
        params.require(:comment).permit(:user_id, :recipe_id, :content)
    end

    def reply_params
        params.require(:reply).permit(:user_id, :comment_id, :content)
    end
end