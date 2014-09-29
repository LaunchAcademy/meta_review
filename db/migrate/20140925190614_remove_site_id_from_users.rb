class RemoveSiteIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :comments, :site_id
  end
end
