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
    @girl = Girl.find(params[:id])
  end
  
  def update
    @girl = Girl.find(params[:id])
  
    if @girl.update(girl_params.except(:images))
  
      # Agar new images upload hui hain to append karo
      if params[:girl][:images].present?
        params[:girl][:images].each do |image|
          @girl.images.attach(image)
        end
      end
  
      redirect_to girls_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end
  def destroy
    @girl = Girl.find(params[:id])
    @girl.destroy
    redirect_to girls_path, notice: "Profile deleted successfully."
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
