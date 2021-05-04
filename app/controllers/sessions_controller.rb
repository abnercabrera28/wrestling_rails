class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by_username(params[:user][:username])

        if params["user"]["username"].empty? || params["user"]["password"].empty?
            flash[:error] = "Cannot leave fields blank"
        end

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to wrestlers_path
        else
            flash[:message] = "Incorrect Username or Password"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def omniauth
        
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end
        
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to wrestlers_path
        else
            flash[:message] = "Incorrect credentials"
            redirect_to login_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end