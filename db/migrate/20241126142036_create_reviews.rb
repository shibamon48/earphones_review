class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :maker
      t.text :bofy
      t.string :image
      t.float :rating

      t.timestamps
    end
  end
end
