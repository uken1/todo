class TasksController < ApplicationController
  before_action :find_user
  before_action :find_task, :only => [:show, :edit, :update, :destroy, :done]
  
  def index
    # @task = Task.all
    @name = params[:name]
    @tasks = @user.tasks.search(@name)
  end

  def show
  end

  def new
    @task = @user.tasks.build(:status => false)
  end

  def edit
  end
  
  def create
    @task = @user.tasks.build(task_params)
    
    if @task.save
      redirect_to user_tasks_path(@user,@task), :notice => "タスクを登録しました。"
    else
      redirect_to :action => "new"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to user_tasks_path(@user,@task), :notice => "タスクを登録しました。"
    else
      render :action => "edit"
    end
  end
  
  def destroy
   @task.destroy
   redirect_to user_tasks_path(@user), :alert => "タスクを削除しました。"
  end
  
  def unclosed
# @tasks = Task.where(:status => false)
# @tasks = Task.unclosedをP9-11で以下に変更
   @tasks = @user.tasks.unclosed
   render :action => "index"
  end
  
  def done
   @tasks = Task.update(:status => true)
# redirect_to tasks_pathをP9-11で以下に変更
   redirect_to user_tasks_path(@user)
  end
  
  private
  def task_params
    params.require(:task).permit(:name,:deadline,:status)
  end
  
  def find_user
    @user = User.find(params[:user_id])
  end
  
  def find_task
    @task = @user.tasks.find(params[:id])
  end
  
end
