class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,               null: false
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :last_sign_in_ip

      t.integer :permissions_level
      t.datetime :last_sign_in_at

      t.timestamps
    end
  end
end
