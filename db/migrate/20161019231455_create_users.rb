class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer    :role_id
      t.string     :email
      t.string     :password
      t.string     :confirm_password 
      t.timestamps
    end
  end
end
