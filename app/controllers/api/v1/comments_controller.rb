class Api::V1::CommentsController < ApplicationController
    def index
        comments = Comment.where(post_id: params[:post_id])
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: {error: 'Error creating comment'}
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
