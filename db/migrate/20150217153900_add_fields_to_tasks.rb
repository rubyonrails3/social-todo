class AddFieldsToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :user, index: true
    add_foreign_key :tasks, :users
    add_column :tasks, :done, :boolean, default: false
  end
end
