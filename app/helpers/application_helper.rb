module ApplicationHelper
    def current_admin
        begin
            Admin.find(session[:admin_id])
        rescue
            false
        end
    end

    def logged_in?
        !!current_admin
    end

    def authorized
        redirect to new_session_path unless logged_in?
    end
end
