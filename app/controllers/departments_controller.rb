class DepartmentsController < ApplicationController
    def create
        @department = Department.new(:name => params[:name])
        @department.save
        @departments = Department.all
    end
end
