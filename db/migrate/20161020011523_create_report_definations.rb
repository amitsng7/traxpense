class CreateReportDefinations < ActiveRecord::Migration[5.0]
  def change
    create_table :report_definations do |t|
      t.integer   :policy_id
      t.string    :currency
      t.integer   :frequency
      t.string    :report_header
      t.timestamps
    end
  end
end
