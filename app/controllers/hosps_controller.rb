class HospsController < ApplicationController
	def index
		@hosps = Hosp.all	
	end

  def show
    @hosp = Hosp.find(params[:id])
  end

  def new
    unless current_user.role == "patient"
      @hosp = Hosp.new
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def create
    @hosp = Hosp.new(hosp_params)
    # return render body: @hosp.inspect
    if @hosp.save
      flash[:notice] = "You have successfully added hosp"
      redirect_to hosps_path
    else
      redirect_to new_hosp_path
    end
  end

  def edit
    unless current_user.role == "patient"
      @hosp = Hosp.find(params[:id])
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def update
    @hosp = Hosp.find(params[:id])
    if @hosp.update_attributes(hosp_params)
      flash[:notice] = "You have successfully updated hosp "
      redirect_to hosps_path
    else
      flash[:error] = "Something went wrong. please try again."
      redirect_to edit_hosp_path(@hosp)
    end
  end

  def hosp_params
    params.require(:hosp).permit(:name, :address, :city, :state, :image, :user_id)
  end
end
