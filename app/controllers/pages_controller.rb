class PagesController < ApplicationController
    before_filter :authenticate_user!, :only => [:workspace]

  def home
#      department_id = params[:department_id] ? params[:department_id] : current_user.department_id

 #     @all_unassigned_tasks = Task.all_unassigned_tasks(department_id)
  end

  def workspace
      @open_tasks   = Task.all_my_open_tasks(current_user.id)
      @for_review   = Task.all_my_tasks_for_review(current_user.id)
      @for_approval = Task.all_my_tasks_for_approval(current_user.id)
      @to_review    = Task.all_my_tasks_to_review(current_user.id)
      @to_approve   = Task.all_my_tasks_to_approve(current_user.id)

      @notifications = Notification.my_notifications(current_user.id)
  end
end
