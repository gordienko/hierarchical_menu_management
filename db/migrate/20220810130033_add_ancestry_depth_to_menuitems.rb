class AddAncestryDepthToMenuitems < ActiveRecord::Migration[7.0]
  def change
    add_column :menuitems, :ancestry_depth, :integer, default: 0
  end
end
