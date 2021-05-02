class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by_username(params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to images_path
        else
            flash[:message] = "Incorrect Username or Password"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

end