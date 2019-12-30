class AddUserToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_attachment :users, :avatar

  end
end
