class TasksController < ApplicationController
  
  def create
    @task = Task.create(task_params)
    @task.hours_left = @task.hours_total
    binding.pry

    if @task.save
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
	render nothing: true
    end
  end

  private
    def task_params
      params.require(:task).permit(:description, :hours_total, :hours_left, :color, :story_id)
    end

end
