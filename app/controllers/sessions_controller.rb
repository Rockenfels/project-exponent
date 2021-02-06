class SessionsController < ApplicationController
    include ApplicationHelper

    def new
        @admin = Admin.new()
        render 'session/login'
    end

    def create
        admin = Admin.find_by(email: params[:admin][:email])
        if admin.authenticate(params[:admin][:password])
            session[:admin_id] = admin.id
            redirect_to root_path
        else
            render :new, alert("incorrect email or password, please try again.")
        end
    end

    def destroy
        if logged_in?
            session.clear()
        else
            redirect_to root_path, alert("You don't have permission to do that.")
        end
    end
end
