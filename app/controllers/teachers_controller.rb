class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end
  
  def new
    @teacher = Teacher.new
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params)
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
