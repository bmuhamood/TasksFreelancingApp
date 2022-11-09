class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :destroy]

    def index
        @task = Task.all.order("created_at DESC")
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to @task
        else
            render "new"
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to @task
        else
            render "edit"
        end
    end

    def destroy
        @task.destroy
        redirect_to root_path
    end

    private

    def task_params
        params.require(:task).permit(:description, :company, :title, :url)
    end

    def find_task
        @task = Task.find(params[:id])
    end

end
