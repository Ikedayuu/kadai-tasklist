class AddUserIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title, :string
    add_reference :tasks, :user, foreign_key: true
  end
end