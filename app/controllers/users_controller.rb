class UsersController < ApplicationController
  before_action :advance_category
  
  def show
    @categories = Category.all 
    @user = User.find(params[:id])
    @tasks = @user.tasks.order('created_at DESC')
    redirect_to root_path unless @user == current_user
  end

  
  private

  
  
end
