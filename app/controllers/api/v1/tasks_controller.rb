class Api::V1::TasksController < ApplicationController

  def create
    @task = services['CreatesTask'].create current_user: current_user, params: task_params
    respond_to do |format|
      format.json { render template: 'api/v1/tasks/create', status: :created }
    end
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
