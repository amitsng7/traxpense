class CreatePoliciesUsersRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :policies_users_roles do |t|
      t.integer   :policy_id
      t.string    :email
      t.integer   :role_id
      t.string    :submit_to_user
      t.string    :approves_to_user
      t.integer   :maximum_amount
      t.string    :alternate_approver
      t.boolean   :auto_approv
      t.timestamps
    end
  end
end
