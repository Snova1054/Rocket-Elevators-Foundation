class AddCustomerToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_reference :interventions, :customer, foreign_key: true, null: false
  end
end
