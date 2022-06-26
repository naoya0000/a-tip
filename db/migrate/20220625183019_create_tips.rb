class CreateTips < ActiveRecord::Migration[6.1]
  def change
    create_table :tips do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :company
      t.integer :money
      t.timestamps
    end
  end
end
