class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|

      t.integer "parent_id"
      t.string "attribute_name"
      t.integer "attribute_level"
      t.string "description"
      t.timestamps
      
    end
  end
end
