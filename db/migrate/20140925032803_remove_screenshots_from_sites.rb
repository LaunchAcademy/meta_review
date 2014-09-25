class RemoveScreenshotsFromSites < ActiveRecord::Migration
  def change
    remove_column :sites, :screenshot
  end
end
