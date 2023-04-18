class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        email = params[:user][:email]
        pw = params[:user][:password]

        @user = User.find_by_credentials(email, pw)

        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            @user = User.new(email: email)
            flash.now[:errors] = ["Invalid username or password. Please try again!"]
            render :new
        end
    end

    def destroy
        logout!

        redirect_to new_session_url
    end
end
