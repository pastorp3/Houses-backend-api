class AddReviewsToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :reviews, :integer
  end
end
