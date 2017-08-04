class AddDeadlineToBug < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :deadline, :time
  end
end
