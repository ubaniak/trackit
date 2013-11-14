class PagesController < ApplicationController
    before_filter :authenticate_user!, :only => [:workspace]
  def home
  end

  def workspace
      @open_tasks   = Task.all_my_open_tasks(current_user.id)
      @for_review   = Task.all_my_tasks_for_review(current_user.id)
      @for_approval = Task.all_my_tasks_for_approval(current_user.id)
      @to_review    = Task.all_my_tasks_to_review(current_user.id)
      @to_approve   = Task.all_my_tasks_to_approve(current_user.id)

      @notifications =[]
  end
end
