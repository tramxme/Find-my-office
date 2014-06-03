class WelcomeController < ApplicationController
  def index
    my_array = Teacher.all
    @teachers = Kaminari.paginate_array(my_array).page(params[:page]).per(50)
  end
end
