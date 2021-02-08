class SongsController < ApplicationController
    include ApplicationHelper

    def index 
        @songs = Song.all

        redirect_to songs_path
    end

    def show
        @song = Song.find(params[:id])
        if @song.exist?
            redirect_to song_path(@song.id)
        else
            redirect_to song_path, alert: "Song not found, have a look at these instead."
        end
    end

    def new
        @song = Song.new()
    
    end

    def create
       if logged_in?() 
            @song = Song.new(song_params)

            if @song.save
                redirect_to song_path(@song.id)
            else
                render :new
            end
       end
    end

    def edit
        if logged_in?()
            render edit_song_path(params[:id])
        else
            redirect_to song_path(params[:id]), alert: "You must be logged in to edit songs."
        end
    end

    def update
        if logged_in?()
            @song = song.find(params[:id])

            if @song.update(song_params)
                redirect_to song_path(@song.id)
            else
                render edit_song_path(@song.id)
            end
        else
            redirect_to song_path(params[:id]), alert: "You must be logged in to edit songs."
        end
    end

    def destroy
        if logged_in?()
           Song.find(params[:id])
        else
            redirect_to song_path(params[:id]), alert: "You must be logged in to remove songs."
        end
    end

    private

    def song_params 
        params.require(:song).permit(:title, :content)
    end
end
