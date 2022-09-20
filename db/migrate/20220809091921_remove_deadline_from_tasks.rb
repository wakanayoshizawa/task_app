class RemoveDeadlineFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :deadline, :string
  end
end
