class PostsController < ApplicationController
    include ApplicationHelper

    def index 
        @post = Post.all

        redirect_to Post_path
    end

    def show
        @post = Post.find(params[:id])
        if @post.exist?
            redirect_to post_path(@post.id)
        else
            redirect_to post_path, alert: "Post not found, have a look at these instead."
        end
    end

    def new
        @post = Post.new()
    
    end

    def create
       if logged_in?() 
            @post = Post.new(post_params)

            if @post.save
                redirect_to post_path(@post.id)
            else
                render :new
            end
       end
    end

    def edit
        if logged_in?()
            render edit_post_path(params[:id])
        else
            redirect_to post_path(params[:id]), alert: "You must be logged in to edit posts."
        end
    end

    def update
        if logged_in?()
            @post = post.find(params[:id])

            if @post.update(post_params)
                redirect_to post_path(@post.id)
            else
                render edit_post_path(@post.id)
            end
        else
            redirect_to post_path(params[:id]), alert: "You must be logged in to edit posts."
        end
    end

    def destroy
        if logged_in?()
           Poem.find(params[:id])
        else
            redirect_to poem_path(params[:id]), alert: "You must be logged in to remove poems."
        end
    end

    private

    def post_params 
        params.require(:post).permit(:title, :content)
    end
end
