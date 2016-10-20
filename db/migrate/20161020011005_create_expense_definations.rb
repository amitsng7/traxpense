class CreateExpenseDefinations < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_definations do |t|
      t.integer   :policy_id
      t.boolean   :violation
      t.boolean   :def_reimburse
      t.boolean   :def_billable
      t.integer   :rate_per_mile
      t.integer   :rate_per_km
      t.string    :def_unit
      t.string    :def_dist_cat
      t.integer   :hourly_wage
      t.integer   :max_exp_age
      t.integer   :max_exp_amt
      t.boolean   :receipt_req
      t.timestamps
    end
  end
end
