class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy assign done ]
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :destroy, :update]
  before_action :advance_category
  

  def index
    @tasks  = Task.all.page(params[:page]).order(id: :desc).per(12)
    @tasks_done = Task.where.not(start_time:nil)
    if params[:latest]
      @tasks = Task.latest.page(params[:page]).order(id: :desc).per(12)
    elsif params[:old]
      @tasks = Task.old.page(params[:page]).order(id: :desc).per(12)
    else
      @Tasks = Task.all.page(params[:page]).order(id: :desc).per(12)
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path } 
        format.js 
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Task was successfully created." }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to request.referer
    flash[:success] = "削除に成功しました。"
  end

  def edit 
    unless @task.user == current_user
      redirect_to  new_task_path
    end
  end


  def update
    if @task.user != current_user
      redirect_to  root_path
    else
      if @task.update(task_params)
        redirect_to request.referer
      else
        flash.now[:danger] = '編集に失敗しました。'
        render request.referer
      end
    end
  end

  def assign
  end

  def done
    @today = Date.today 
    @task.update(status: "完了", start_time: @today) 
    redirect_to request.referer
  end
  def calendar
    @tasks  = Task.reorder('id DESC')
    task_count = Task.all.count
  end
  

  private
    
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:title, :content, :status, :start_time, :user_id, :category_id)
  end
  def baria_user
    unless Task.find(params[:id]).user.id.to_i == current_user.id
        redirect_to tasks_path(current_user)
    end
  end
  
  
  
end
