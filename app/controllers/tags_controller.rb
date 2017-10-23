class TagsController < ApplicationController
  before_action :find_task, :find_user
  
  def create
    unless params[:name].blank?
      tag = Tag.find_or_create_by(name: params[:name])
      @task.tags << tag unless @task.tags.find_by(:id => tag.id)
    end
    redirect_to user_task_path(@user, @task)
  end
  
  def destroy
    tag = Tag.find(params[:id]) 
    @task.tags.destroy(tag)
    unless tag.tasks.any?
      tag.destroy
    end
      redirect_to user_task_path(@user, @task)
  end

  private
  def find_task
    @task = Task.find(params[:task_id])
  end
  
  def find_user
    @user = User.find(params[:user_id])
  end
end
