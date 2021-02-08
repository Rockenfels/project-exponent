class ShortStoriesController < ApplicationController
    include ApplicationHelper

    def index 
        @stories = ShortStory.all

        redirect_to short_stories_path
    end

    def show
        @story = ShortStory.find(params[:id])
        if @story.exist?
            redirect_to short_story_path(@story.id)
        else
            redirect_to short_stories_path, alert: "Story not found, have a look at these instead."
        end
    end

    def new
        @story = ShortStory.new()
    end

    def create
       if logged_in?() 
            @story = ShortStroy.new(story_params)

            if @story.save
                redirect_to short_story_path(@story.id)
            else
                render :new
            end
       end
    end

    def edit
        if logged_in?()
            render edit_short_story_path(params[:id])
        else
            redirect_to short_story_path(params[:id]), alert: "You must be logged in to edit short stories."
        end
    end

    def update
        if logged_in?()
            @story = story.find(params[:id])

            if @story.update(story_params)
                redirect_to short_story_path(@story.id)
            else
                render edit_short_story_path(@story.id)
            end
        else
            redirect_to short_story_path(params[:id]), alert: "You must be logged in to edit short stories."
        end
    end

    def destroy
        if logged_in?()
           ShortStory.find(params[:id])
        else
            redirect_to story_path(params[:id]), alert: "You must be logged in to remove short stories."
        end
    end

    private

    def story_params 
        params.require(:short_story).permit(:title, :content)
    end

end
