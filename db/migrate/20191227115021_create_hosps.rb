class CreateHosps < ActiveRecord::Migration[5.2]
  def change
    create_table :hosps do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
