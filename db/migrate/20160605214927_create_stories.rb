class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :project
      t.string :sprint
      t.string :title
      t.integer :story_points
      t.integer :priority
      t.string :keyword
      t.text :acceptance_criteria
      t.text :description
      t.string :color
      t.integer :order
      t.timestamps
    end

    create_table :stories_tags, id: false do |t|
      t.belongs_to :stories, index: true
      t.belongs_to :tags, index: true
    end
  end
end
