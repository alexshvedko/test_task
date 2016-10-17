class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.references :serie, foreign_key: true
      t.string :name
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
