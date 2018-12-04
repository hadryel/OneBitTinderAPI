class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.references :liker, foreign_key: { to_table: :users }
      t.references :likee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
