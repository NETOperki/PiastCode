class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :when
      t.string :where

      t.timestamps
    end
  end
end
