class CreateWorkers < ActiveRecord::Migration

  def up
    create_table :workers do |t|

      t.string "email"
      t.string "facebook"
      t.string "google"
      t.string "twitter"
      t.string "vine"

      t.timestamps
    end
  end

  def down
  	drop_table :workers
  end

end
