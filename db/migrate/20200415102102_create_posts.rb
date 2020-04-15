class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :use_id
      t.text :title
      t.text :body
      t.string :post_image

      t.timestamps
    end
  end
end
