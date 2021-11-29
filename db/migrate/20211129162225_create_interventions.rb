class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :author, null: false, default: ""
      t.datetime :start_date
      t.datetime :end_date
      t.string :result, null: false, default: "incomplete"
      t.text :report, null: false
      t.string :status, null: false, default: "pending"
    end
  end
end
