module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to wrestlers_path if logged_in?
    end

    def authorized
        @wrestler = Wrestler.find_by_id(params[:id])
        @wrestler.user_id == session[:user_id]
    end
end
