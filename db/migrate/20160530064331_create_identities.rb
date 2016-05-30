class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :url
      t.string :token
      t.datetime :expires_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
