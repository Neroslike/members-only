class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
