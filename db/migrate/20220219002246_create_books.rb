class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image
      t.text :description
      t.numeric :price
      t.decimal :rating
      t.string :genre
      t.index [:title, :author], unique: true

      t.timestamps
    end
  end
end
