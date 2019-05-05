class CreateGameEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :game_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
