class RenameValueToWeight < ActiveRecord::Migration
  def change
    rename_column :exercise_items, :value, :weight
  end
end
