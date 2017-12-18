class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
    add_reference :articles, :author, foreign_key: true
  end
end
