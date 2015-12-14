class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, index: true, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.datetime :birthday, null: false
      t.string :email, unique: true
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
