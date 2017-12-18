class CreateMentors < ActiveRecord::Migration[5.1]
  def change
    create_table :mentors do |t|
      t.string :uid, null: false
      t.string :nickname, null: false
    end
  end
end
