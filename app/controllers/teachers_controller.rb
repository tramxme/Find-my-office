class TeachersController < ApplicationController
  before_filter :admin_required, :only => [:new, :create] 

  def admin_required
    if current_user.nil? || current_user.observer?
      redirect_to new_user_session_path 
      flash[:notice] = "You need to be an admin to add new information"
    end
    flash[:notice] = "Sorry you're not authorized for this action"
  end

  def index
    @institute = Institute.find(params[:institute_id])
    @teachers = @institute.teachers.all
  end
  
  def new
    @institute = Institute.find(params[:institute_id])
    @teacher = @institute.teachers.new
  end

  def create
    @institute = Institute.find(params[:institute_id])
    @teacher = @institute.teachers.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Office hour was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @teacher }
      else
        format.html { render action: 'new' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Office hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teacher_url }
      format.json { head :no_content }
    end
  end

  def search
    if params[:search]
      @list_teachers = []
      Teacher.all.each do |teacher|
        @list_teachers.push(teacher) if (params[:search].downcase == teacher.last_name.downcase || params[:search].downcase == teacher.first_name.downcase)
      end
    end
    @list_teachers
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:last_name, :first_name, :department, :office_address, :email_address, :phone_number )
    end
end
