class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
    #@task.user = current_user
    #@tasks = Task.order(created_at: :desc).page(params[:page]).per(3)
  end
  
  def new
    # @task = Task.new
    # @task.user = current_user
    @task = current_user.tasks.build
  end
  

  def create
    # @task = Task.new(task_params)
    # @task.user = current_user
    @task = current_user.tasks.build(task_params)
    # @task = Task.new(content: params[:task][:content], status: params[:task][:status])
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to @task.user
    #redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status, :user)
  end
  
end
