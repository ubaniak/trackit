class UserController < ApplicationController

    def create
        @user = User.new(:name => params[:user], :email => params[:email], :password => params[:password])
        @user.save
        @users = User.all
    end
end
