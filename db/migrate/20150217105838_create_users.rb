class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, default: "", null: false
      t.string :last_name, default: "", null: false
      t.string :email, default: "", null: false
      t.string :password_digest, default: "", null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
