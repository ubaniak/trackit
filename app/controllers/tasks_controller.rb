class TasksController < ApplicationController

    before_filter :authenticate_user!

    def new
    end

    def create
        @task = Task.new(:title => params[:title],
                        :description => params[:description],
                        :assigned_to => params[:assigned_to],
                        :department_id => params[:department_id],
                        :created_by => current_user.id)

        @task.open_task
        if params[:department_id].nil? and not params[:assigned_to].nil?
            @task.department = @task.assigned.department
        end
        @task.save
        redirect_to workspace_path
    end

    def show
        @task = Task.find(params[:id])
    end

    def reopen_task
        @task = Task.find(params[:id])
        @task.open_task
        redirect_to workspace_path
    end

    def close_task
        @task = Task.find(params[:id])
        @task.close
        redirect_to workspace_path
    end

    ############
    # Due Date
    ############
    def set_due_date
        @task = Task.find(params[:id])
    end

    def cancel_due_date
        @task = Task.find(params[:id])
    end

    def update_due_date
        @task = Task.find(params[:id])
        @task.due_date = DateTime.parse("#{params[:due_date]} #{params[:due_time]}")
        @task.save
        redirect_to task_path(@task)
    end

    ############
    # Reviewer
    ############

    def update_reviewer
        @task = Task.find(params[:id])
        @task.set_reviewer(params[:reviewer])
        redirect_to task_path(@task)
    end

    def set_reviewer
        @task = Task.find(params[:id])
    end

    def cancel_reviewer
        @task = Task.find(params[:id])
    end

    def send_for_review
        @task = Task.find(params[:id])
        @task.send_for_review
        redirect_to workspace_path
    end

    ############
    # Approver
    ############
    def update_approver
        @task = Task.find(params[:id])
        @task.set_approver(params[:approver])
        redirect_to task_path(@task)
    end

    def set_approver
        @task = Task.find(params[:id])
    end

    def cancel_approver
        @task = Task.find(params[:id])
    end

    def send_for_approval
        @task = Task.find(params[:id])
        @task.send_for_approval
        redirect_to workspace_path
    end

    ############
    # Assigned
    ############
    def update_assigned
        @task = Task.find(params[:id])
        @task.assigned_to = params[:assigned]
        @task.save
        redirect_to task_path(@task)
    end

    def set_assigned
        @task = Task.find(params[:id])
    end

    def cancel_assigned
        @task = Task.find(params[:id])
    end

    ############
    # Department
    ############
    def update_department
        @task = Task.find(params[:id])
        @task.department_id = params[:department]
        @task.save
        redirect_to task_path(@task)
    end

    def set_department
        @task = Task.find(params[:id])
    end

    def cancel_department
        @task = Task.find(params[:id])
    end

end
