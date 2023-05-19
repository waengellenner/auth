class TasksController < ApplicationController
  def index 
    if @current_user
    @tasks = Task.where({ "user_id" => @current_user["id"] })
    @task = Task.new
    else
    redirect_to "/login"
    end
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task["user_id"] = @current_user["id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
      if @task["user_id"] == @current_user["is"]
      @task.destroy
      end
    redirect_to "/tasks"
  end
end
