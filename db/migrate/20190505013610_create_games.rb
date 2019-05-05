class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :publisher
      t.date :release_date

      t.timestamps
    end
  end
end
