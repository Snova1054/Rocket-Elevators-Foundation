class AddBatteryToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_reference :interventions, :battery, foreign_key: true, null: false
  end
end
