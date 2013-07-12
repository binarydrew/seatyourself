class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :user, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
