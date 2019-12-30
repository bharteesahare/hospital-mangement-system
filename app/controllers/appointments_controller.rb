class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
   end
  def new
    unless current_user.role == "doctor"
      @appointment = Appointment.new
      @diseases = Disease.all
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      # return render body: @appointment.inspect
      flash[:notice] = "You have successfully set appointment with"
      redirect_to root_path
    else
      redirect_to new_appointment_path
    end
  end

  def render_list
    @diseases = Disease.where(hosp_id: params[:hospital_id])
    @doctors = User.where(disease_id: params[:disease_id], role: "doctor")
    disease_html_string = render_to_string(partial: 'disease_list',layout: false,:formats => [:html], locals: {})
    doctor_html_string = render_to_string(partial: 'user_list',layout: false,:formats => [:html], locals: {})
    respond_to do |format|
      format.json {render json: {disease_html: disease_html_string, doctor_html: doctor_html_string} }
    end
  end

  def edit
    unless current_user.role == "doctor"
      @appointment = Appointment.find(params[:id])
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      flash[:notice] = "You have successfully update appointment with "
      redirect_to root_path
    else
      flash[:error] = "Something went wrong. please try again."
      redirect_to edit_appointment_path(@appointment)
    end
  end

  def destroy
    unless current_user.role == "doctor"
      @appointment = Appointment.find(params[:id])
      if @appointment.destroy
        flash[:notice] = "You have successfully delete appointment."
        redirect_to root_path
      else
        flash[:error] = "Something went wrong. please try again."
        redirect_to root_path
      end
    else
      redirect_to root_path
      flash[:alert] = "You are not authorize this page."
    end
  end

 

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :description, :user_id, :hosp_id, :disease_id)
  end
end
