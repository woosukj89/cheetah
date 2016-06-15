class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :type
      t.string :value
      t.string :label
      t.string :note
      t.boolean :note_enabled
    end
  end
end
