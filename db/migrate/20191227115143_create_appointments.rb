class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.date :date
      t.time :time
      t.references :disease
      t.references :hosp
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
