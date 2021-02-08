class StaticController < ApplicationController
    def index
        render :index
    end

    def about
        render :about
    end

    def contact
        render :contact
    end
end
