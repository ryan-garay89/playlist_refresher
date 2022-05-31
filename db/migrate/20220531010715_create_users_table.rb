class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users_tables do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :access_token
      t.string :refresh_token
      t.timestamps
    end
  end
end
