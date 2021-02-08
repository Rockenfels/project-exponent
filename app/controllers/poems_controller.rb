class PoemsController < ApplicationController
    include ApplicationHelper

    def index 
        @poems = Poem.all

        redirect_to poems_path
    end

    def show
        @poem = Poem.find(params[:id])
        if @poem.exist?
            redirect_to poem_path(@poem.id)
        else
            redirect_to poem_path, alert: "Poem not found, have a look at these instead."
        end
    end

    def new
        @poem = Poem.new()
    
    end

    def create
       if logged_in?() 
            @poem = Poem.new(poem_params)

            if @poem.save
                redirect_to poem_path(@poem.id)
            else
                render :new
            end
       end
    end

    def edit
        if logged_in?()
            render edit_poem_path(params[:id])
        else
            redirect_to poem_path(params[:id]), alert: "You must be logged in to edit poems."
        end
    end

    def update
        if logged_in?()
            @poem = poem.find(params[:id])

            if @poem.update(poem_params)
                redirect_to poem_path(@poem.id)
            else
                render edit_poem_path(@poem.id)
            end
        else
            redirect_to poem_path(params[:id]), alert: "You must be logged in to edit poems."
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

    def poem_params 
        params.require(:poem).permit(:title, :content)
    end
end
