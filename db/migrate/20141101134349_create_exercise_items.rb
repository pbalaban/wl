class CreateExerciseItems < ActiveRecord::Migration
  def change
    create_table :exercise_items do |t|
      t.references :workout, index: true, null: false
      t.references :exercise, index: true, null: false
      t.integer :time
      t.integer :repeats_count
      t.integer :value

      t.timestamps
    end
  end
end
