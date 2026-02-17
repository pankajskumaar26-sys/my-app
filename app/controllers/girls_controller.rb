class GirlsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  def index
    @girls = Girl.all
    
  end
  def create
    @girl = Girl.new(girl_params)
  
    if @girl.save
      redirect_to new_girl_path, notice: "New Girl was successfully Added."
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def show
    @girl = Girl.find(params[:id])
  end

  def new
    @girl = Girl.new
    flash[:show_animation] = true
  end

  def edit
  end
  def girl_params
    params.require(:girl).permit(
      :name,
      :age,
      :city,
      :weight,
      :height,
      :chest_size,
      :body_type,
      :description,
      images: []  
    )
  end
end
