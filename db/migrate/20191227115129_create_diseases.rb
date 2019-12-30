class CreateDiseases < ActiveRecord::Migration[5.2]
  def change
    create_table :diseases do |t|
      t.string :name
      t.references :hosp, foreign_key: true
      t.references :user

      t.timestamps
    end
  end
end
