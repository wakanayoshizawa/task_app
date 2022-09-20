class ChangeColumnDefaultTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :category_id, :integer, null: false
  end
end
