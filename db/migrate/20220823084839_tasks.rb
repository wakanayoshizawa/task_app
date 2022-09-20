class Tasks < ActiveRecord::Migration[7.0]
  def change
    drop_table :task_categories
  end
end
