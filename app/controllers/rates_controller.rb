class RatesController < ApplicationController

    def index
      @rates = Rate.all
    end
  
    def new
      @rate = Rate.new
    end
  
    def create
      @rate = Rate.new(rate_params)
      if @rate.save
        redirect_to rates_path, notice: "Rate added successfully"
      else
        render :new
      end
    end

    def edit
      @rate = Rate.find(params[:id])
    end
    
    def update
      @rate = Rate.find(params[:id])
      if @rate.update(rate_params)
        redirect_to rates_path, notice: "Rate updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @rate = Rate.find(params[:id])
      @rate.destroy
      redirect_to rates_path, notice: "Rate deleted successfully."
    end
    
    private
  
    def rate_params
      params.require(:rate).permit(:name, :rate_per_hour, :rate_short, :rate_full_night)
    end
  end