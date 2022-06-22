class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :title1
      t.string :title2
      t.string :img1
      t.string :img2
      t.string :company
      t.integer :category
      t.integer :season
      t.integer :pickup

      t.timestamps
    end
  end
end
