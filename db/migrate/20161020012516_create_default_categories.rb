class CreateDefaultCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :default_categories do |t|
      t.string   :name
      t.timestamps
    end
  end
end
