class AddCreatorToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :Event, :string
    add_reference :events, :user, foreign_key: true
  end
end
