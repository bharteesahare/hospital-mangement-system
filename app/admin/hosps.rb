ActiveAdmin.register Hosp do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :city, :state, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :user_id
  #
  # or
  #
  permit_params do
    permitted = [:name, :address, :city, :state, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :user_id]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
