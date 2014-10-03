class RemovreDisLike < ActiveRecord::Migration
  def change
    remove_column :reviews, :down_votes
    remove_column :reviews, :up_votes
  end
end
