class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, index: true, null: false
      t.integer :values_type, index: true, null: false
      t.references :place, index: true, null: false
      t.timestamps
    end
  end
end
