class Api::V1::PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        puts post_params
        post = Post.new(post_params)
        if post.save
            render json: post
        else
            render json: {error: 'Error creating post'}
        end
        
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

end
