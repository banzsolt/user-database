class CreateAttributeStores < ActiveRecord::Migration
  def change
    create_table :attribute_stores do |t|

      t.integer "attribute_id"
      t.integer "store_id"
      t.timestamps

    end
  end
end
