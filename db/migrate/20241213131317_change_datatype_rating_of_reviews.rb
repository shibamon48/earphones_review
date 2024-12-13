class ChangeDatatypeRatingOfReviews < ActiveRecord::Migration[7.2]
  def change
    change_column :reviews, :rating, :integer
  end
end
