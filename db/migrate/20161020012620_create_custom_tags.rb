class CreateCustomTags < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_tags do |t|
      t.integer   :policy_id
      t.string    :name
      t.integer   :gl_code
      t.boolean   :tag_required
      t.timestamps
    end
  end
end
