class CommentsController < ApplicationController
    def create
        @comment = Comment.new(:comment => params[:comment], :created_by => current_user.id, :task_id => params[:task_id])
        @comment.save
        @task = Task.find(params[:task_id])
    end
end
