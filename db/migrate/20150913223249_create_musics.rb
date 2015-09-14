class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|

      t.string "Name"
      t.timestamps
    end
  end
end
