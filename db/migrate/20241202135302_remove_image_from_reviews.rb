class RemoveImageFromReviews < ActiveRecord::Migration[7.2]
  def change
    remove_column :reviews, :image, :string
  end
end
