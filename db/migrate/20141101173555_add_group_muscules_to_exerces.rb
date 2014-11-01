class AddGroupMusculesToExerces < ActiveRecord::Migration
  def change
    add_column :exercises, :muscle_group, :string, null: false, index: true
  end
end
