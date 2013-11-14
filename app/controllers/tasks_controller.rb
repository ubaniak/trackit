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
end
