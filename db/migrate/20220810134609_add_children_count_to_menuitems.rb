class AddChildrenCountToMenuitems < ActiveRecord::Migration[7.0]
  def change
    add_column :menuitems, :children_count, :integer, default: 0
  end
end
