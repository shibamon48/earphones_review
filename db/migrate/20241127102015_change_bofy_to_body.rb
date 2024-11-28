class ChangeBofyToBody < ActiveRecord::Migration[7.2]
  def change
    rename_column :reviews, :bofy, :body
  end
end
