class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name, index: true, null: false
      t.text :description
      t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
