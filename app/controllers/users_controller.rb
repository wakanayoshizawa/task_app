class UsersController < ApplicationController
  before_action :advance_category
  
  def show
    @categories = Category.all 
    @user = User.find(params[:id])
    @tasks = @user.tasks.page(params[:page]).order(id: :desc)
    redirect_to root_path unless @user == current_user
    if params[:latest]
      @tasks = Task.latest.page(params[:page]).order(id: :desc).per(12)
    elsif params[:old]
      @tasks = Task.old.page(params[:page]).order(id: :desc).per(12)
    else
      @Tasks = Task.all.page(params[:page]).order(id: :desc).per(12)
    end
  end

  
  private

  
end
