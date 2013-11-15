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

    def update_reviewer
        @task = Task.find(params[:id])
        @task.reviewed_by = params[:reviewer]
        @task.save
        redirect_to task_path(@task)
    end

    def set_reviewer
        @task = Task.find(params[:id])
    end

    def cancel_reviewer
        @task = Task.find(params[:id])
    end
end
