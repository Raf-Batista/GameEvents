class DropGameGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :game_genres
  end
end
