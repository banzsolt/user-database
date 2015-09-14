class CreateAttributeMusics < ActiveRecord::Migration
  def change
    create_table :attribute_musics do |t|

      t.integer "attribute_id"
      t.integer "music_id"
      t.datetime "starting_time"
      t.datetime "end_time"
      t.timestamps

    end
  end
end
