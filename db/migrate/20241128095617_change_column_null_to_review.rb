class ChangeColumnNullToReview < ActiveRecord::Migration[7.2]
  def change
    change_column_null :reviews, :name, false
    change_column_null :reviews, :maker, false
  end
end
