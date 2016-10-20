class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table     :expenses do |t|
      t.integer      :user_id
      t.integer      :report_id
      t.boolean      :remiburse
      t.boolean      :billable
      t.datetime     :date,          null: false
      t.string       :merchant,      null: false
      t.integer      :amount,        null: false
      t.string       :category
      t.string       :comment 
      t.timestamps
    end
  end
end
