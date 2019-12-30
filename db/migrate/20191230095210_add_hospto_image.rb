class AddHosptoImage < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :hosps, :image
  end
end
