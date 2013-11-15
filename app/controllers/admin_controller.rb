class AdminController < ApplicationController
    before_filter :authenticate_user!
    before_filter :admin_only
  def panal
  end

  def users
      @users = User.all
  end

  def departments
      @departments = Department.all
  end
end
