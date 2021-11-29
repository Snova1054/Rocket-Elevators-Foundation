class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author, null: false
      t.integer :customer_id, null: false
      t.integer :building_id, null: false
      t.integer :battery_id, null: false
      t.integer :column_id
      t.integer :elevator_id
      t.integer :customer_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :result, null: false
      t.text :report, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
