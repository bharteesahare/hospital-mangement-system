ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :dob, :address, :city, :state, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :role
  #
  # or
  #
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :dob, :address, :city, :state, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :role]
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
