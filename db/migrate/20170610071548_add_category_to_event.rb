class AddCategoryToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :category, :integer
  end
end
