module ApplicationHelper
    def current_admin
        Admin.find(session[:admin_id]) || nil
    end

    def logged_in?
        !!current_admin
    end

    def authorized
        redirect to new_session_path unless logged_in?
    end
end
