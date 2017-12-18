class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid,              null: false
      t.string :provider,         null: false

      t.timestamps null: false
    end

    add_index :users, :uid,                unique: true
  end
end
