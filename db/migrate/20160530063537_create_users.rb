class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :gender
      t.string :email_token
      t.boolean :verified , default: false

      t.timestamps null: false
    end
  end
end
