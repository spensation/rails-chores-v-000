class TasksController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def create
    @house_chore = HouseChore.find(params[:house_chore_id])
    @task = @house_chore.tasks.build(task_params)

    if @task.save
      respond_to do |f|
        f.json {render :json => @task}
        f.html {redirect_to house_chore_path(@house_chore)}
      end
    else
      # raise params.inspect
      flash[:notice] = "Task was not saved"

      render :'house_chore/show'
    end
  end

  def destroy
    @house_chore = HouseChore.find(params[:house_chore_id])
    @task = Task.find(params[:task_id] || params[:id])
    @task.destroy

    redirect_to house_chore_path(@house_chore)
  end

  private

    def task_params
      params.require(:task).permit(:description, :house_chore_id)
    end
end
