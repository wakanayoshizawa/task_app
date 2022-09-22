class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :advance_category

  def new
    @category = Category.new
  end

  def index
    @task = Task.new
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks.page(params[:page]).order(id: :desc)
      @all_task = @category.tasks.count
    end
    
  end

  def list
    @categories = Category.all
    
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: "登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update!(category_params)
      redirect_to categories_list_path
    else
      render :edit 
    end 
  end

  def destroy
    @category.destroy
    redirect_to categories_list_path
    flash[:success] = "削除に成功しました。"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
