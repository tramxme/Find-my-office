class InstitutesController < ApplicationController
  before_filter :admin_required, :only => [:new, :create, :edit, :update, :destroy] 

  def admin_required
    if current_user.nil? || current_user.observer?
      redirect_to new_user_session_path 
      flash[:notice] = "You need to be an admin to add new information"
    end
    flash[:notice] = "Sorry you're not authorized for this action"
  end

  def new
    @institute = Institute.new
  end

  def create
    @institute = Institute.new(institute_params)
    if @institute.save
      redirect_to @institute
    else
      render 'new'
    end 
  end

  def edit
    @institute = Institute.find(params[:id])
  end

  def update
    @institute = Institute.find(params[:id])
    if @institute.update(institute_params)
      redirect_to @institute
    else
      render 'edit'
    end
  end

  def index
    @institutes = Institute.all
  end

  def show
    @institute = Institute.find(params[:id])
  end

  def destroy
    @institute = Institute.find(params[:id])
    @institute.destroy
  end
  
  private
  def institute_params
    params.require(:institute).permit(:name, :address, :city, :state, :zipcode)
  end
end
