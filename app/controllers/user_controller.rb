class UserController < ApplicationController

    def create
        @user = User.new(:name => params[:user], 
                         :email => params[:email], 
                         :password => params[:password],
                         :department_id => params[:department],
                         :manager => params[:manager])

        @user.save
        @users = User.all
    end
end
