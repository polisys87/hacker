class CreateNewests < ActiveRecord::Migration
  def change
    create_table :newests do |t|
      t.string :title
      t.string :link
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
