class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.date :date, index: true, null: false
      t.references :place, index: true, null: false
      t.timestamps
    end
  end
end
