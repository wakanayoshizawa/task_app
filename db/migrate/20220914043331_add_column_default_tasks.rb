class AddColumnDefaultTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :category_id, :integer, null: false, :default => 'その他'
   
  end
end
