class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :book_count
      t.string :parent_id

      t.timestamps null: false
    end
  end
end
