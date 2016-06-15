class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :hours_total
      t.integer :hours_left
      t.string :color
      t.timestamps
      t.references :story
    end

    create_table :tasks_profiles, id: false do |t|
      t.belongs_to :tasks, index: true
      t.belongs_to :profiles, index: true
    end
  end
end
