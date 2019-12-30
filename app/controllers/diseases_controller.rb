class DiseasesController < ApplicationController
	def index
		@diseases = current_user.diseases
	end

  def new
    unless current_user.role == "patient"
      @disease = Disease.new
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def create
    @disease = Disease.new(disease_params)
    # return render body: params.inspect
    if @disease.save
      flash[:notice] = "You have successfully added disease"
      redirect_to diseases_path
    else
      redirect_to new_disease_path
    end
  end

  def edit
    unless current_user.role == "patient"
      @disease = Disease.find(params[:id])
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def update
    @disease = Disease.find(params[:id])
    if @disease.update_attributes(disease_params)
      flash[:notice] = "You have successfully updated disease "
      redirect_to diseases_path
    else
      flash[:error] = "Something went wrong. please try again."
      redirect_to edit_disease_path(@disease)
    end
  end

  def show
    @disease = Disease.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:name, :hosp_id, :user_id)
  end
end
