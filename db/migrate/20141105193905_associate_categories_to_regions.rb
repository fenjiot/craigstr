class AssociateCategoriesToRegions < ActiveRecord::Migration
  def change
    add_column :categories, :region_id, :integer
  end
end
