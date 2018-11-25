class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :bio
      t.string :avatar
      t.string :github_username
      t.string :role
      t.integer :views

      t.timestamps
    end
  end
end
