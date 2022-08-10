class AddAncestryToMenuitems < ActiveRecord::Migration[7.0]
  def change
    add_column :menuitems, :ancestry, :string
    add_index :menuitems, :ancestry
  end
end
