class AdminController < ApplicationController
  def panal
  end

  def users
      @users = User.all
  end

  def departments
      @departments = Department.all
  end
end
