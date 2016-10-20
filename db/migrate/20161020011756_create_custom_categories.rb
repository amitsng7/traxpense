class CreateCustomCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_categories do |t|
      t.integer   :policy_id
      t.string    :name
      t.integer   :gl_code
      t.integer   :payroll_code
      t.string    :max_amt_cat
      t.integer   :max_amt
      t.string    :receipt
      t.string    :comment
      t.timestamps
    end
  end
end
