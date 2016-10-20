class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer      :user_id
      t.string       :name
      t.datetime     :from_date,          null: false
      t.datetime     :to_date,            null: false
      t.string       :status
      t.string       :comment 
      t.timestamps
    end
  end
end
